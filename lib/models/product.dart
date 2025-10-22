class ProductVariant {
  final int id;
  final int productId;
  final String name;
  final String? sku;
  final double price;
  final double? costPrice;
  final int stockQuantity;
  final double? weight;
  final String? image;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductVariant({
    required this.id,
    required this.productId,
    required this.name,
    this.sku,
    required this.price,
    this.costPrice,
    required this.stockQuantity,
    this.weight,
    this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: int.tryParse(json['id'].toString()) ?? 0,
      productId: int.tryParse(json['product_id'].toString()) ?? 0,
      name: json['name'] ?? '',
      sku: json['sku'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      costPrice: json['cost_price'] != null
          ? double.tryParse(json['cost_price'].toString())
          : null,
      stockQuantity: int.tryParse(json['stock_quantity'].toString()) ?? 0,
      weight: json['weight'] != null
          ? double.tryParse(json['weight'].toString())
          : null,
      image: json['image'],
      isActive: json['is_active'].toString() == 'true',
      createdAt: DateTime.tryParse(json['created_at'].toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.tryParse(json['updated_at'].toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String slug;
  final String? sku;
  final int categoryId;
  final int unitId;
  final String? description;
  final String? shortDescription;
  final Map<String, dynamic>? specifications;
  final List<String> images; // ✅ luôn là List<String>
  final double price;
  final double? comparePrice;
  final double? costPrice;
  final double? weight;
  final String? dimensions;
  final int stockQuantity;
  final int minStock;
  final bool trackInventory;
  final bool isFresh;
  final int? shelfLifeDays;
  final String? storageConditions;
  final String? origin;
  final String? harvestSeason;
  final bool organicCertified;
  final bool isFeatured;
  final bool isActive;
  final String? seoTitle;
  final String? seoDescription;
  final int? createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String? searchVector;
  final List<ProductVariant> variants;

  // 👉 Thêm 2 field phụ cho tiện hiển thị
  final String? categoryName;
  final String? unitName;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    this.sku,
    required this.categoryId,
    required this.unitId,
    this.description,
    this.shortDescription,
    this.specifications,
    required this.images,
    required this.price,
    this.comparePrice,
    this.costPrice,
    this.weight,
    this.dimensions,
    required this.stockQuantity,
    required this.minStock,
    required this.trackInventory,
    required this.isFresh,
    this.shelfLifeDays,
    this.storageConditions,
    this.origin,
    this.harvestSeason,
    required this.organicCertified,
    required this.isFeatured,
    required this.isActive,
    this.seoTitle,
    this.seoDescription,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.searchVector,
    required this.variants,
    this.categoryName,
    this.unitName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      sku: json['sku'],
      categoryId: int.tryParse(json['category_id'].toString()) ?? 0,
      unitId: int.tryParse(json['unit_id'].toString()) ?? 0,
      description: json['description'],
      shortDescription: json['short_description'],
      specifications: json['specifications'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['specifications'])
          : null,
      images: json['images'] != null && json['images'] is List
          ? List<String>.from(json['images'].map((e) => e.toString()))
          : [], // ✅ luôn là List<String>
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      comparePrice: json['compare_price'] != null
          ? double.tryParse(json['compare_price'].toString())
          : null,
      costPrice: json['cost_price'] != null
          ? double.tryParse(json['cost_price'].toString())
          : null,
      weight: json['weight'] != null
          ? double.tryParse(json['weight'].toString())
          : null,
      dimensions: json['dimensions'],
      stockQuantity: int.tryParse(json['stock_quantity'].toString()) ?? 0,
      minStock: int.tryParse(json['min_stock'].toString()) ?? 0,
      trackInventory: json['track_inventory'].toString() == 'true',
      isFresh: json['is_fresh'].toString() == 'true',
      shelfLifeDays: json['shelf_life_days'] != null
          ? int.tryParse(json['shelf_life_days'].toString())
          : null,
      storageConditions: json['storage_conditions'],
      origin: json['origin'],
      harvestSeason: json['harvest_season'],
      organicCertified: json['organic_certified'].toString() == 'true',
      isFeatured: json['is_featured'].toString() == 'true',
      isActive: json['is_active'].toString() == 'true',
      seoTitle: json['seo_title'],
      seoDescription: json['seo_description'],
      createdBy: json['created_by'] != null
          ? int.tryParse(json['created_by'].toString())
          : null,
      createdAt: DateTime.tryParse(json['created_at'].toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.tryParse(json['updated_at'].toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: json['deleted_at'] != null
          ? DateTime.tryParse(json['deleted_at'].toString())
          : null,
      searchVector: json['search_vector'],
      variants: json['variants'] != null && json['variants'] is List
          ? (json['variants'] as List)
              .map((v) => ProductVariant.fromJson(v))
              .toList()
          : [],
      categoryName: json['category_name'],
      unitName: json['unit_name'],
    );
  }
}
