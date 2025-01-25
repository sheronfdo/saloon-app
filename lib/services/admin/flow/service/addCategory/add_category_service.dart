import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategoryService {
  Future<List<Map<String, String>>> collectGeneralCategories() async {
    CollectionReference categories = FirebaseFirestore.instance.collection('categories');
    QuerySnapshot querySnapshot = await categories.get();
    List<Map<String, String>> tempList = querySnapshot.docs.map((doc) {
      return {
        'id': doc.id,
        'name': doc['name'].toString(),
      };
    }).toList();
    return tempList;
  }
}
