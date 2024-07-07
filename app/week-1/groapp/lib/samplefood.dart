import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groapp/foodmodel.dart';
import 'package:http/http.dart' as http;

class Samplefood extends StatelessWidget {
  Samplefood({super.key});
  List<Foodmodel> fooddata = [];
  Future getfood() async {
    var response =
        await http.get(Uri.https('openfoodfacts.org', 'api/v3/product'));
    var jsondata = jsonDecode(response.body);
    for (var eachfood in jsondata['product']) {
      final food = Foodmodel(product: eachfood['product']);
      fooddata.add(food);
    }
    print(fooddata);
  }

  @override
  Widget build(BuildContext context) {
    getfood();
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
