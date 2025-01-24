import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloon_app/screens/admin/flow/changeLocation/changeLocation_viewmodel.dart';

class ChangeLocationView extends StatefulWidget {
  const ChangeLocationView({super.key});

  @override
  _ChangeLocationViewState createState() => _ChangeLocationViewState();
}

class _ChangeLocationViewState extends State<ChangeLocationView> {
  late GoogleMapController _mapController;
  late LatLng _saloonLocation;

  @override
  void initState() {
    super.initState();
    _saloonLocation =
        LatLng(25.085598, 55.139360); // Initial location (latitude, longitude)
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChangeLocationViewModel(),
      child: Consumer<ChangeLocationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Stack(
              children: [
                // Full-screen map (Google Maps)
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _saloonLocation,
                    zoom: 15.0, // Adjust zoom level as needed
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('saloon_location'),
                      position: _saloonLocation,
                      infoWindow: InfoWindow(title: 'Saloon Location'),
                    ),
                  },
                ),

                // Header with back button
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // Done button at the bottom
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 180, 29, 6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Save location and navigate back
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
