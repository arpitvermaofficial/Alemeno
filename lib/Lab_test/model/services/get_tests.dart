import 'dart:convert';
import 'package:alemeno/Lab_test/model/testModel.dart';

import '../test_data.dart';


class GetTests {
  List<TestModel> getAllProducts()  {
    List<TestModel> list_of_products = [];
    try {
      for(int i=0; i<Test_data.length; i++) {
        list_of_products.add(TestModel.fromJson(Test_data[i]));
      }
    } catch (e) {
      print("error is --> $e");
    }
    return list_of_products;
  }
}