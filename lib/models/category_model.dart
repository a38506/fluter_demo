import 'dart:convert';

class Category {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final String? image;
  final int? parentId;
  final int sortOrder;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final List<Category>? children; // ✅ cho phép cây lồng nhau

  Category({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.image,
    this.parentId,
    required this.sortOrder,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.children,
  });

  /// ✅ Parse từ JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'],
      image: json['image'],
      parentId: json['parent_id'] != null
          ? int.tryParse(json['parent_id'].toString())
          : null,
      sortOrder: int.tryParse(json['sort_order'].toString()) ?? 0,
      isActive: json['is_active'].toString() == 'true' ||
          json['is_active'] == true,
      createdAt: DateTime.tryParse(json['created_at'].toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: DateTime.tryParse(json['updated_at'].toString()) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      deletedAt: json['deleted_at'] != null
          ? DateTime.tryParse(json['deleted_at'].toString())
          : null,
      children: json['children'] != null && json['children'] is List
          ? (json['children'] as List)
              .map((e) => Category.fromJson(e))
              .toList()
          : null,
    );
  }

  /// ✅ Chuyển sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'image': image,
      'parent_id': parentId,
      'sort_order': sortOrder,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      if (children != null)
        'children': children!.map((e) => e.toJson()).toList(),
    };
  }

  /// ✅ Hỗ trợ clone nhanh
  Category copyWith({
    int? id,
    String? name,
    String? slug,
    String? description,
    String? image,
    int? parentId,
    int? sortOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    List<Category>? children,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      image: image ?? this.image,
      parentId: parentId ?? this.parentId,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      children: children ?? this.children,
    );
  }

  /// ✅ Parse danh sách JSON
  static List<Category> listFromJson(List<dynamic> data) {
    return data.map((e) => Category.fromJson(e)).toList();
  }

  /// ✅ Parse từ chuỗi JSON
  static List<Category> fromJsonString(String jsonStr) {
    final data = json.decode(jsonStr);
    return data is List ? listFromJson(data) : [];
  }
}
