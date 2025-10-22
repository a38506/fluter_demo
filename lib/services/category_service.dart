import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:temp_project/models/category_model.dart';

class CategoryService {
  static const String baseUrl = 'http://192.168.56.1:5000/api/v1/categories';

  /// 🟢 Lấy danh sách tất cả danh mục
  Future<List<Category>> fetchAllCategories() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      // Linh hoạt cho mọi trường hợp JSON
      final List categoriesJson = decoded is List
          ? decoded
          : (decoded['categories'] ?? decoded['data'] ?? []);

      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('❌ Failed to load categories (${response.statusCode})');
    }
  }

  /// 🟣 Lấy cây danh mục (nếu có endpoint `/categories/tree`)
  Future<List<Category>> fetchCategoryTree() async {
    final response = await http.get(Uri.parse('$baseUrl/tree'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      final List categoriesJson = decoded is List
          ? decoded
          : (decoded['categories'] ?? decoded['data'] ?? []);

      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('❌ Failed to load category tree (${response.statusCode})');
    }
  }

  /// 🔵 Lấy chi tiết 1 danh mục theo ID
  Future<Category> fetchCategoryById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      // Một số backend trả về trực tiếp object hoặc gói trong 'data'
      final Map<String, dynamic> categoryJson = decoded is Map<String, dynamic>
          ? (decoded['data'] ?? decoded)
          : {};

      return Category.fromJson(categoryJson);
    } else {
      throw Exception('❌ Failed to load category ID=$id (${response.statusCode})');
    }
  }
}
