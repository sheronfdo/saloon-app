import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:saloon_app/screens/admin/flow/home/admin_home_view.dart';
import 'package:saloon_app/services/admin/flow/service/package/package_service.dart';

class SavePackageView extends StatelessWidget {
  final String serviceId;
  const SavePackageView({Key? key, required this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController titleController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    final PackageService packageService = PackageService();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    _buildHeader(context),
                    const SizedBox(height: 30),
                    _buildTitle(),
                    const SizedBox(height: 40),
                    _buildFormFields(titleController, priceController, descriptionController),
                    const SizedBox(height: 40),
                    _buildActionButtons(context, packageService, titleController, priceController, descriptionController),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Background decorations
  Widget _buildBackground() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 260,
            height: 270,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 239, 239),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(130),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 240,
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 250, 222, 222),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(130),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //header
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(IconlyBold.notification,
                  color: Color(0xFFB3B3B3), size: 28),
              onPressed: () {
                // Notification action
              },
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Title
  Widget _buildTitle() {
    return const Center(
      child: Text(
        'ADD SERVICES',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // Form fields for input
  Widget _buildFormFields(
      TextEditingController titleController,
      TextEditingController priceController,
      TextEditingController descriptionController,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Title',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: 'Hair Cut for Adult',
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Color(0xFF1265B2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color(0xFF1265B2), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Color(0xFF1265B2), width: 1),
            ),
          ),
          cursorColor: Color(0xFF4AA8FF),
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 20),
        const Text(
          'Price',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Input field for the price
            Expanded(
              child: TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: '500.00',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0xFF1265B2), width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0xFF1265B2), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Color(0xFF1265B2), width: 1.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.blue,
              ),
            ),
            const SizedBox(width: 8.0),
            // USD Label
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
              child: const Text(
                'USD',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: descriptionController,
          maxLines: 8,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            hintText:
                'Experience precision and style with our professional haircuts...',
            hintStyle: const TextStyle(
              color: Colors.grey, // Grey hint text color
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color(0xFF1265B2), width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color(0xFF1265B2), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color(0xFF1265B2), width: 1.0),
            ),
          ),
          style: const TextStyle(color: Colors.black),
          cursorColor: const Color(0xFF1265B2),
        ),
      ],
    );
  }

  // Action buttons for Save and Deactivate
  Widget _buildActionButtons(
      BuildContext context,
      PackageService packageService,
      TextEditingController titleController,
      TextEditingController priceController,
      TextEditingController descriptionController,
      ) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final String title = titleController.text.trim();
            final double? price = double.tryParse(priceController.text.trim());
            final String description = descriptionController.text.trim();

            if (title.isEmpty || price == null || description.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill all fields')),
              );
              return;
            }

            try {
              await packageService.addNewPackage(
                catId: serviceId,
                title: title,
                price: price,
                description: description,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Package saved successfully')),
              );
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminHomeView()));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to save package: $e')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFAA2008),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () async {
            try {
              await packageService.deactivatePackage(catId: serviceId, packageId: "PACKAGE_ID_HERE");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Package deactivated successfully')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to deactivate package: $e')),
              );
            }
          },
          child: const Text(
            'Deactivate Service',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFD00E0E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
