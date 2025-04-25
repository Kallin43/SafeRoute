import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(SafeRouteApp());
}

class SafeRouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeRoute',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(28.6139, 77.2090); // Delhi

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _sendSOS() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("🚨 SOS Alert Sent!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SafeRoute Map")),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton.extended(
              onPressed: _sendSOS,
              label: Text("SOS"),
              icon: Icon(Icons.warning, color: Colors.white),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
