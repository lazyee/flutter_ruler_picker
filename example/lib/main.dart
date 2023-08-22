// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruler Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ruler Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RulerPickerController? _rulerPickerController;

  num currentValue = 40;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  Widget _buildBtn(num value) {
    return InkWell(
      onTap: () {
        _rulerPickerController?.value = value;
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: Colors.blue,
          child: Text(
            value.toString(),
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentValue.toStringAsFixed(1),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
            const SizedBox(height: 50),
            RulerPicker(
              controller: _rulerPickerController!,
              onBuildRulerScaleText: (index, value) {
                return value.toInt().toString();
              },
              ranges: const [
                RulerRange(begin: 0, end: 10, scale: 0.1),
                RulerRange(begin: 10, end: 100, scale: 1),
                RulerRange(begin: 100, end: 1000, scale: 10),
                RulerRange(begin: 1000, end: 10000, scale: 100),
                RulerRange(begin: 10000, end: 100000, scale: 1000)
              ],
              scaleLineStyleList: const [
                ScaleLineStyle(
                    color: Colors.grey, width: 1.5, height: 30, scale: 0),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 25, scale: 5),
                ScaleLineStyle(
                    color: Colors.grey, width: 1, height: 15, scale: -1)
              ],

              onValueChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
              width: MediaQuery.of(context).size.width,
              height: 80,
              rulerMarginTop: 8,
              // marker: Container(
              //     width: 8,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         color: Colors.red.withAlpha(100),
              //         borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBtn(8.4),
                SizedBox(width: 10),
                _buildBtn(30),
                SizedBox(width: 10),
                _buildBtn(50.5),
                SizedBox(width: 10),
                _buildBtn(1000),
                SizedBox(width: 10),
                _buildBtn(40000),
                SizedBox(width: 10),
                _buildBtn(50000),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
