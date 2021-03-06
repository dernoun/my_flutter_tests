import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_tests/guided-doing/url_launcher_test.dart';

import 'guided-doing/camera_test.dart';

// import 'guided-doing/cached_image_network.dart';
Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  // final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  // final firstCamera = cameras.first;

  runApp(MyApp());
}
