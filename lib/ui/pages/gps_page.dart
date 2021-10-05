import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:todo_list_web/ui/widgets/future_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:todo_list_web/utils/extensions.dart';

class GPSPage extends StatefulWidget {
  const GPSPage({Key? key}) : super(key: key);

  @override
  _GPSPageState createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {
  Future<Position> _getCurrentPosition() => Geolocator.getCurrentPosition();
  Completer<GoogleMapController> _controller = Completer();
  late Position gpsPosition;
  late CameraPosition gpsCameraPosition;

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Example'),
      ),
      body: FutureWidget<Position>(
          future: _getCurrentPosition(),
          onSuccess: (position) {
            gpsPosition = position;
            gpsCameraPosition = CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14.4746,
            );
            return _buildPage();
          },
          onError: (error) => _showErrorWidget(error),
          onWait: () => Center(child: CircularProgressIndicator())),
    );
  }

  Widget _buildPage() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'The position is:\nlat: ${gpsPosition.latitude}\nlong: ${gpsPosition.longitude}\nalt: lat: ${gpsPosition.altitude}',
            ),
          ),
          Container(
            width: 300,
            height: 300,
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: _goToGpsLocation,
              child: Text(
                'Move to GPS Location in Map',
                style: context.textTheme.bodyText1,
              ))
        ],
      );

  Widget _showErrorWidget(String error) => Text(error);

  Future<void> _goToGpsLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(gpsCameraPosition));
  }
}
