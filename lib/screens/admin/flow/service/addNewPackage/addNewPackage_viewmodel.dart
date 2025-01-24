import 'package:flutter/material.dart';

class AddNewPackageViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> packages = [];

  void init() {
    packages = [
      {
        'title': 'Hair cut for Adults',
        'price': '50 USD',
        'imagePath': 'assets/images/cutbead.png',
        'isDeactivated': false,
      },
      {
        'title': 'Hair cut for Kids',
        'price': '50 USD',
        'imagePath': 'assets/images/cutbead.png',
        'isDeactivated': false,
      },
      {
        'title': 'Beard Cutting',
        'price': '50 USD',
        'imagePath': 'assets/images/cutbead.png',
        'isDeactivated': false,
      },
      {
        'title': 'Beard Cutting',
        'price': '50 USD',
        'imagePath': 'assets/images/cutbead.png',
        'isDeactivated': true,
      },
    ];
    notifyListeners();
  }

  void addNewPackage(String title, String price, String imagePath) {
    packages.add({
      'title': title,
      'price': price,
      'imagePath': imagePath,
      'isDeactivated': false,
    });
    notifyListeners();
  }

  void deletePackage(int index) {
    packages.removeAt(index);
    notifyListeners();
  }

  void togglePackageStatus(int index) {
    packages[index]['isDeactivated'] = !packages[index]['isDeactivated'];
    notifyListeners();
  }
}
