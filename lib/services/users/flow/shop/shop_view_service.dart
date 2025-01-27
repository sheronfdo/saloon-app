import 'package:cloud_firestore/cloud_firestore.dart';

class ShopViewService {
  Future <List<Map<String, dynamic>>> getSaloonsByCategory({required String catId}) async {
    CollectionReference adminsRef =
        FirebaseFirestore.instance.collection('admins');
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
}
