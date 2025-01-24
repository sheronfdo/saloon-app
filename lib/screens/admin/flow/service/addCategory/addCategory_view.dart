import 'package:flutter/material.dart';

class AddNewCategoryView extends StatefulWidget {
  const AddNewCategoryView({super.key});

  @override
  State<AddNewCategoryView> createState() => _AddNewCategoryViewState();
}

class _AddNewCategoryViewState extends State<AddNewCategoryView> {
  String? selectedCategory; // State to hold the selected category

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
                    items: const [
                      DropdownMenuItem(
                        value: "Category 1",
                        child: Text("Category 1"),
                      ),
                      DropdownMenuItem(
                        value: "Category 2",
                        child: Text("Category 2"),
                      ),
                      DropdownMenuItem(
                        value: "Category 3",
                        child: Text("Category 3"),
                      ),
                    ],
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
                  onPressed: () {
                    if (selectedCategory != null) {
                      print("Selected category: $selectedCategory");
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
