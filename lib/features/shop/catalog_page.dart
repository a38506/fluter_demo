import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_project/models/category_model.dart';
import 'package:temp_project/models/product.dart';
import 'package:temp_project/services/product_service.dart';
import 'package:temp_project/widgets/product_catalog_widget.dart';
import 'package:temp_project/widgets/sort_filter_widget.dart';

class CatalogPage extends StatefulWidget {
  final Category category; // ✅ thêm tham số

  const CatalogPage({Key? key, required this.category}) : super(key: key);

  static void go(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CatalogPage(category: category),
      ),
    );
  }

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    // 🔹 Gọi API lấy sản phẩm theo danh mục
    _productsFuture = ProductService().fetchProductsByCategory(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: theme.colorScheme.onPrimary),
        title: Text(
          widget.category.name,
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: theme.colorScheme.onPrimary,
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: SizedBox(
            height: 96,
            child: Column(
              children: [
                // ✅ có thể hiện các "nhóm nhỏ" của danh mục nếu bạn muốn
                SizedBox(
                  height: 48,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: const [
                        _CategoryChip(label: 'Tất cả'),
                        SizedBox(width: 8),
                        _CategoryChip(label: 'Bán chạy'),
                        SizedBox(width: 8),
                        _CategoryChip(label: 'Khuyến mãi'),
                      ],
                    ),
                  ),
                ),
                const SortFilterWidget(),
              ],
            ),
          ),
        ),
      ),

      // 🔹 Nội dung chính
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Lỗi tải sản phẩm: ${snapshot.error}'),
            );
          }

          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return const Center(
                child: Text('Chưa có sản phẩm trong danh mục này.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) =>
                ProductCatalogWidget(product: products[index]),
            separatorBuilder: (context, _) =>
                const Divider(height: 8, color: Colors.transparent),
            itemCount: products.length,
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;

  const _CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return RawChip(
      backgroundColor: Colors.black,
      label: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
