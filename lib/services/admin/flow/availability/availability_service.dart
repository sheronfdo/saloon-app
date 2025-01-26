import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AvailabilityService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> setAvailability() async {
    List<Map<String, dynamic>> availability = [
      {
        "id": "monday",
        "data": {
          "day": "Monday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      },
      {
        "id": "tuesday",
        "data": {
          "day": "Tuesday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      },
      {
        "id": "wednesday",
        "data": {
          "day": "Wednesday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      },
      {
        "id": "thursday",
        "data": {
          "day": "Thursday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      },
      {
        "id": "friday",
        "data": {
          "day": "Friday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      },
      {
        "id": "saturday",
        "data": {
          "day": "Saturday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      },
      {
        "id": "sunday",
        "data": {
          "day": "Sunday",
          "time": [
            {"start": "7.00 am", "end": "12.00 pm"},
            {"start": "1.00 pm", "end": "5.00 pm"}
          ]
        }
      }
    ];
    availability.forEach(
      (element) async {
        Map<String, dynamic> day = element;
        print("day == ");
        print(day["id"]);
        await _firestore
            .collection('admins')
            .doc(_auth.currentUser?.uid)
            .collection("availability")
            .doc(day["id"])
            .set(day["data"]);
      },
    );
  }
}
