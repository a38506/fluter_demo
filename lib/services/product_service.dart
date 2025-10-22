import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:temp_project/models/product.dart';

class ProductService {
  static const String baseUrl = 'http://192.168.56.1:5000/api/v1/products';

  /// 🔹 Lấy toàn bộ sản phẩm
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      // Linh hoạt cho mọi trường hợp
      final List productsJson = decoded is List
          ? decoded
          : (decoded['products'] ?? decoded['data'] ?? []);

      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  /// 🔹 Lấy sản phẩm theo danh mục
  Future<List<Product>> fetchProductsByCategory(int categoryId,
      {int page = 1, int limit = 20}) async {
    try {
      final url =
          Uri.parse('$baseUrl?page=$page&limit=$limit&category_id=$categoryId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // ✅ Kiểm tra cấu trúc JSON
        final List productsJson = data['products'] ?? data['data'] ?? [];

        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load products for category $categoryId (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Error fetching products by category: $e');
    }
  }
}
