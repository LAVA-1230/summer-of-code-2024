import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Bar_scan extends StatefulWidget {
  const Bar_scan({super.key});

  @override
  State<Bar_scan> createState() => _Bar_scanState();
}

class _Bar_scanState extends State<Bar_scan> {
  String barcode = "Unknown";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Scan Result",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$barcode",
            style: TextStyle(color: Colors.black, fontSize: 10),
          ),
          SizedBox(
            height: 70,
          ),
          ElevatedButton(onPressed: ScanBarcode, child: Text("Scan Barcode"))
        ],
      )),
    );
  }

  Future ScanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (!mounted) return;
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = "Failed to get platform version.";
    }
  }
}
