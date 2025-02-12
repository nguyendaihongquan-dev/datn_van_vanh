import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ParkingSlotService {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref("parking/parkingLot/slots");
  final List<ValueNotifier<bool>> slots =
      List.generate(24, (_) => ValueNotifier<bool>(false));

  final StreamController<int> _availableSlotsController =
      StreamController<int>.broadcast();

  Stream<int> get availableSlotsStream => _availableSlotsController.stream;

  ParkingSlotService() {
    _listenToSlotChanges();
  }

  void _listenToSlotChanges() {
    _database.onValue.listen((event) {
      int availableCount = 0;
      int totalSlots = 24;

      if (event.snapshot.value is Map) {
        Map<dynamic, dynamic> slotsData = event.snapshot.value as Map;

        for (int i = 0; i < totalSlots; i++) {
          var slotData = slotsData['slot${i + 1}'];
          bool irSensor = slotData?['irSensor'] ?? false;
          bool datcho = slotData?['datcho'] ?? false;
          bool isOccupied = irSensor || datcho;

          slots[i].value = isOccupied;
          if (!isOccupied) {
            availableCount++;
          }
        }
      }

      _availableSlotsController.add(availableCount);
    });
  }

  Future<void> updateSlotStatus(int slotIndex, bool isOccupied) async {
    await _database.child('slot$slotIndex/datcho').set(isOccupied);
    slots[slotIndex].value = isOccupied;
  }

  void dispose() {
    _availableSlotsController.close();
  }
}
