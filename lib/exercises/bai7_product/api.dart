import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

class TestApi {
  static Future<List<Product>> getAllProduct() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Lỗi API");
    }
  }
}
