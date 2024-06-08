import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _setMarkers();
  }

  void _setMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('bin1'),
          position: LatLng(-15.3875, 28.3228), // Example coordinates for a bin
          infoWindow: InfoWindow(title: 'Recycling Bin 1'),
        ),
      );
      // Add more markers for other bin locations
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nearby Bins')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(-15.3875, 28.3228), // Example initial position
          zoom: 14.0,
        ),
        markers: _markers,
      ),
    );
  }
}
