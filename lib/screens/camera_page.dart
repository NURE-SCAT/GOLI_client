import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import '../theme/hex_color.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "Recognized text will be here";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: HexColor("FFB803"),
        buttonColor: HexColor("FFB803"),
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('GOLI scan your docs'),
        ),
        body: Center(
            child: new ListView(
          children: <Widget>[
            Center(child: new Text(_textValue)),
            new RaisedButton(
              onPressed: _read,
              child: new Text('Start Scanning'),
            ),
          ],
        )),
      ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      _textValue = "";
      setState(() {
        texts.forEach((element) {
          _textValue += element.value + " ";
        });
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }
}
