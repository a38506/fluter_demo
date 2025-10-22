import 'package:flutter/material.dart';
import 'package:temp_project/features/shop/catalog_page.dart';
import 'package:temp_project/models/category_model.dart';
import 'package:temp_project/services/category_service.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<Category>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = CategoryService().fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh mục sản phẩm'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Category>>(
          future: _categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Lỗi tải danh mục: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            final categories = snapshot.data ?? [];

            if (categories.isEmpty) {
              return const Center(
                child: Text(
                  'Không có danh mục nào.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            // 🔽 Đổi từ GridView → ListView dạng card ngang
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  _categoriesFuture = CategoryService().fetchAllCategories();
                });
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cate = categories[index];
                  return InkWell(
                    onTap: () => CatalogPage.go(context, cate),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // 🏷 Tên danh mục (bên trái)
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                              child: Text(
                                cate.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          // 🖼 Hình ảnh danh mục (bên phải)
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
                              child: cate.image != null && cate.image!.isNotEmpty
                                  ? Image.network(
                                      cate.image!,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                                    )
                                  : const Icon(Icons.image_outlined, size: 60, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
