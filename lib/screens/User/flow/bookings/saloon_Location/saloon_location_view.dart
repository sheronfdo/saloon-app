import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'saloon_location_view_model.dart';

class SaloonLocationView extends StatefulWidget {
  const SaloonLocationView({super.key});

  @override
  _SaloonLocationViewState createState() => _SaloonLocationViewState();
}

class _SaloonLocationViewState extends State<SaloonLocationView> {
  late GoogleMapController _mapController;
  late LatLng _saloonLocation;

  @override
  void initState() {
    super.initState();
    _saloonLocation = LatLng(25.085598, 55.139360); // Saloon location
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SaloonLocationViewModel(),
      child: Consumer<SaloonLocationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _saloonLocation,
                      zoom: 15.0, // Adjust the zoom level as needed
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Navigates back
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(fontSize: 18),
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
