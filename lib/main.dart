import 'package:datn_van_vanh/app/app_routers.dart';
import 'package:datn_van_vanh/firebase_options.dart';
import 'package:datn_van_vanh/provider/loading_provider.dart';
import 'package:datn_van_vanh/provider/manager_provider.dart';
import 'package:datn_van_vanh/provider/user_provider.dart';
import 'package:datn_van_vanh/screens/app_home.dart';
import 'package:datn_van_vanh/screens/login/login_screen.dart';
import 'package:datn_van_vanh/screens/splash/splash_screen.dart';
import 'package:datn_van_vanh/widget/keyboard_widget.dart';
import 'package:datn_van_vanh/widget/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("🔥 Firebase đã khởi tạo thành công!");
  } catch (e) {
    print("🚨 Lỗi khi khởi tạo Firebase: $e");
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getDeviceToken() async {
    await Firebase.initializeApp();
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $token");
    await saveTokenToRealtimeDB(token!);
  }

  Future<void> saveTokenToRealtimeDB(String token) async {
    User? user = FirebaseAuth.instance.currentUser; // Lấy thông tin user

    if (user == null) {
      print("❌ Người dùng chưa đăng nhập, không thể lưu token.");
      return;
    }

    String userId = user.uid; // Lấy UID của user

    try {
      DatabaseReference dbRef =
          FirebaseDatabase.instance.ref("users/$userId/token");

      await dbRef.set({
        "token": token,
        "updatedAt": ServerValue.timestamp, // Lấy timestamp từ Firebase
      });

      print("✅ Token đã được lưu vào Realtime Database!");
    } catch (e) {
      print("🚨 Lỗi khi lưu token vào Realtime Database: $e");
    }
  }

  void checkFirestoreConnection() async {
    try {
      await FirebaseFirestore.instance
          .collection("test")
          .doc("connection")
          .set({
        "status": "connected",
        "timestamp": FieldValue.serverTimestamp(),
      });
      print("✅ Firestore đã kết nối thành công!");
    } catch (e) {
      print("❌ Firestore chưa kết nối được: $e");
    }
  }

  @override
  void initState() {
    FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 8080);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        getDeviceToken(); // Gọi hàm này khi user đã đăng nhập
      } else {
        print("❌ User chưa đăng nhập, không lưu token.");
      }
    });

    // getDeviceToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ManagerProvider()),
      ],
      builder: (context, _) {
        return Consumer<LoadingProvider>(
          builder: (context, loading, child) {
            return KeyboardDismiss(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Stack(
                  children: [
                    MaterialApp(
                      title: 'DATN',
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                        useMaterial3: false,
                      ),
                      debugShowCheckedModeBanner: false,
                      // home: Dashboard(),
                      initialRoute: AppRouters.firstScreen,
                      // Sử dụng StreamBuilder để theo dõi trạng thái đăng nhập
                      // home: StreamBuilder<User?>(
                      //   stream: FirebaseAuth.instance.authStateChanges(),
                      //   builder: (ctx, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.waiting) {
                      //       return const SplashScreen();
                      //     }
                      //     if (snapshot.hasData) {
                      //       return const Dashboard();
                      //     } else {
                      //       return const LoginPage();
                      //     }
                      //   },
                      // ),
                      routes: AppRouters.routes,
                    ),
                    loading.isLoading
                        ? const LoadingWidget()
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
