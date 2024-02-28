import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_identity_kyc/flutter_identity_kyc.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized ( );
  await Permission.camera.request().isGranted;
  await Permission.microphone.request();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> Function() requestPermissions = () async {
    await Permission.camera.request().isGranted;
    await Permission.microphone.request();
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: ElevatedButton(
      style: null,
      onPressed: () {
        FlutterIdentityKyc.showWidget(InputParameters(
            context: context,
            merchantKey: "live_pk_Na5clpyqPNiI8RpCwyWoecB3DpaxczrXTG5NwpO",
            firstName: "Dave",
            lastName: "Emmanuel",
            email: "dave@prembly.com",
            userRef: "2323213d",
            config: "8fbe7ee4-efd7-47f5-9e91-c5e42407ca77",
            onCancel: (response) {
              print(response.status);
            },
            onVerified: (response) {
              print(response);
            },
            onError: (error) => print(error)));
      },
      child: Text('Click to verify'),
    ))));
  }
}
