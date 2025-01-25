import 'package:flutter/material.dart';
import 'package:saloon_app/services/admin/flow/service/addCategory/add_category_service.dart';
import 'package:saloon_app/services/admin/flow/service/category/category_service.dart';


class AddNewCategoryView extends StatefulWidget {
  const AddNewCategoryView({super.key});

  @override
  State<AddNewCategoryView> createState() => _AddNewCategoryViewState();
}

class _AddNewCategoryViewState extends State<AddNewCategoryView> {
     String? selectedCategory; // Selected category ID
     final CategoryService _categoryService = CategoryService();
     List<Map<String, dynamic>> _services = [];
     bool _isLoading = true;

// Dummy category
  List<Map<String, String>> serviceCategories = [];
  bool isLoading = true; // Loading state


  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final categories = await _categoryService.collectCategories();
      setState(() {
        _services = categories;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching categories: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Column(
                  children: [
                    const Text(
                      "NEW CATEGORY",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "You can add services in the category",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Category Dropdown
              const Text(
                "Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCategory,
                    hint: const Text(
                      "Select service category",
                      style: TextStyle(color: Colors.grey),
                    ),
                    items: serviceCategories
                        .map((category) => DropdownMenuItem<String>(
                      value: category["id"],
                      child: Text(category["name"]!),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Confirm Button
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (selectedCategory != null) {
                      // Retrieve selected category name
                      String selectedCategoryName = serviceCategories
                          .firstWhere((category) => category["id"] == selectedCategory)["name"]!;

                      // Call addUserCategory method
                      await AddCategoryService().addUserCategory(
                        catId: selectedCategory!,
                        catName: selectedCategoryName,
                      );

                      print("Category added: ID = $selectedCategory, Name = $selectedCategoryName");

                      // Fetch updated categories after adding a new category
                      await _fetchCategories();
                    } else {
                      print("No category selected");
                    }
                    Navigator.of(context).pop(); // Close the popup
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 199, 66, 9),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
