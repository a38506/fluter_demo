import 'package:flutter/material.dart';
import 'package:temp_project/models/product.dart';
import 'package:temp_project/services/product_service.dart';
import 'package:temp_project/widgets/product_catalog_widget.dart';
import 'package:temp_project/widgets/sort_filter_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Product>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    // 🔹 Gọi API lấy danh sách sản phẩm yêu thích
    // nếu BE bạn chưa có endpoint riêng cho "favorites"
    // thì tạm thời dùng fetchProducts() để test hiển thị
    _favoritesFuture = ProductService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: theme.colorScheme.onPrimary),
        title: Text(
          'Yêu thích',
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: theme.colorScheme.onPrimary),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: SizedBox(
            height: 96,
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: const [
                        _CategoryChip(label: 'Tất cả'),
                        SizedBox(width: 8),
                        _CategoryChip(label: 'Khuyến mãi'),
                        SizedBox(width: 8),
                        _CategoryChip(label: 'Bán chạy'),
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

      // ✅ FutureBuilder để lấy sản phẩm từ API
      body: FutureBuilder<List<Product>>(
        future: _favoritesFuture,
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
              child: Text('Chưa có sản phẩm yêu thích nào.'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (context, _) =>
                const Divider(height: 8, color: Colors.transparent),
            itemBuilder: (context, index) =>
                ProductCatalogWidget(product: products[index]),
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
