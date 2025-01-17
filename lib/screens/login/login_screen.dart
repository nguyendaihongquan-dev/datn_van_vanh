import 'package:datn_van_vanh/app/app_routers.dart';
import 'package:datn_van_vanh/provider/user_provider.dart';
import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/util/app_function.dart';
import 'package:datn_van_vanh/widget/simple_button.dart';
import 'package:datn_van_vanh/widget/simple_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    AppFunction.showLoading(context);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // ignore: use_build_context_synchronously
      context.read<UserProvider>().saveEmailUser(_emailController.text.trim());
      // ignore: use_build_context_synchronously
      AppFunction.hideLoading(context);

      Navigator.pushNamed(
        // ignore: use_build_context_synchronously
        context,
        AppRouters.homeScreen,
      );
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      AppFunction.hideLoading(context);
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Không tìm thấy tài khoản người dùng';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Sai mật khẩu';
      } else {
        errorMessage = 'Lỗi không xác định';
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SimpleInput(
                          titleInput: "",
                          hintText: "Email",
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SimpleInput(
                          titleInput: "",
                          hintText: "Password",
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              "Forgot Password?",
                              style: AppFonts.regular(
                                16,
                                const Color(0xFF613EEA),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SimpleButton(
                          titleButton: "Log in",
                          color: const Color(0XFF613EEA),
                          onPressed: () async {
                            if (_emailController.text.trim().isEmpty ||
                                _passwordController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Vui lòng điền đầy đủ thông tin")),
                              );
                            } else if (_emailController.text
                                    .trim()
                                    .isNotEmpty &&
                                _passwordController.text.trim().isNotEmpty) {
                              _login();
                            }
                            AppFunction.showLoading(context);
                            await Future.delayed(
                                const Duration(milliseconds: 1500));
                            AppFunction.hideLoading(context);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "or ",
                                style: AppFonts.openSansMedium500(
                                  16,
                                  const Color(0xFF212121).withOpacity(0.6),
                                ),
                              ),
                              TextSpan(
                                text: "Signup",
                                style: AppFonts.openSansMedium500(
                                  16,
                                  AppColors.defaultColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
