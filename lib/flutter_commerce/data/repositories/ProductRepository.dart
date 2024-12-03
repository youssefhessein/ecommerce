// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:flutter_ecommerce/flutter_commerce/data/local/models/Product%20Model.dart';
// class ProductRepository{
//     Future<List<Product>> fetchProducts() async{
//       final String response = await rootBundle.loadString('flutter_commerce/data/local/data_sources/product.json') ;
//       final List<dynamic> data = json.decode(response) ;
//       return data.map((product) => Product.fromJson(product)).toList();
//     }
// }