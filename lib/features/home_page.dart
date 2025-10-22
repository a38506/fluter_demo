import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/simple_title_widget.dart';
import '../widgets/banner/banner_simple_1_widget.dart';
import '../widgets/group_products_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '❌ Lỗi tải sản phẩm:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            final products = snapshot.data ?? [];

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),

                  // 🖼 Banner chính
                  const BannerSimple1Widget(
                    'https://res.cloudinary.com/dkebenibr/image/upload/v1760778205/image7_nxfrca.png',
                    'Trái cây tươi',
                  ),

                  const SizedBox(height: 10),

                  // 🏷 Sản phẩm nổi bật
                  GroupProductsWidget(
                    title: const SimpleTitleWidget(
                      title: Text('Sản phẩm nổi bật'),
                      subTitle: Text('Những lựa chọn tốt nhất hôm'),
                      action: Text('Xem thêm'),
                    ),
                    products: products.take(4).toList(),
                  ),

                  const SizedBox(height: 10),

                  // 🆕 Sản phẩm mới
                  GroupProductsWidget(
                    title: const SimpleTitleWidget(
                      title: Text('Sản phẩm mới'),
                      subTitle: Text('Bạn chưa từng thấy trước'),
                      action: Text('Xem thêm'),
                    ),
                    products: products.skip(4).take(4).toList(),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
