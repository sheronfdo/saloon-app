import 'package:cloud_firestore/cloud_firestore.dart';

class ShopViewService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future <List<Map<String, dynamic>>> getSaloonsByCategory({required String catId}) async {
    CollectionReference adminsRef =
        _firestore.collection('admins');
    List<Map<String, dynamic>> adminsWithCuttingCategory = [];
    QuerySnapshot adminsSnapshot = await adminsRef.get();
    for (QueryDocumentSnapshot adminDoc in adminsSnapshot.docs) {
      CollectionReference adminCategoriesRef =
          adminsRef.doc(adminDoc.id).collection('categories');
      DocumentSnapshot cuttingCategoryDoc =
          await adminCategoriesRef.doc(catId).get();
      if (cuttingCategoryDoc.exists) {
        Map<String, dynamic> saloonData = {
          'id': adminDoc.id,
          'imagePath': 'assets/images/cuthair.jpeg',
          'name': adminDoc['saloonName'],
          'address': adminDoc['address'],
          'rating': 4.8,
          'reviews': 319,
        };
        adminsWithCuttingCategory.add(saloonData);
      }
    }
    return adminsWithCuttingCategory;
  }

  Future <List<Map<String, dynamic>>> getSaloonsPackagesByCategory({required String saloonId ,required String catId}) async {
    CollectionReference packages = _firestore
        .collection('admins')
        .doc(saloonId)
        .collection("categories")
        .doc(catId)
        .collection("packages");
    QuerySnapshot packagesSnapshot = await packages.get();
    List<Map<String, dynamic>> tempPackages = [];
    for (QueryDocumentSnapshot packageDoc in packagesSnapshot.docs) {
      tempPackages.add({
        'id': packageDoc.id,
        'name': packageDoc["title"],
        'price': packageDoc['price'],
        'description': packageDoc['description'],
        'imagePath': 'assets/images/cutbead.png',
        'isDeactivated': packageDoc['isDeactivated'],
        'rating': 4.9,
        'reviews': 150,
      });
    }
    return tempPackages;
  }
}
