import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:todo_list_web/ui/widgets/future_widget.dart';

class GPSPage extends StatefulWidget {
  const GPSPage({Key? key}) : super(key: key);

  @override
  _GPSPageState createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {
  Future<Position> _determinePosition() => Geolocator.getCurrentPosition();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Example'),
      ),
      body: FutureWidget<Position>(
          future: _determinePosition(),
          onSuccess: (position) => Center(
              child: Text(
                  'The position is:\nlat: ${position.latitude}\nlong: ${position.longitude}\nalt: lat: ${position.altitude}')),
          onError: (error) => _showErrorWidget(error),
          onWait: () => Center(child: CircularProgressIndicator())),
    );
  }

  Widget _showErrorWidget(String error) => Text(error);
}
