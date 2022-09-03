import 'category_type.dart';

class Category {
  final String id;
  final String name;
  final String assetImagePath;
  final CategoryType categoryType;

  Category({
    required this.id,
    required this.name,
    required this.assetImagePath,
    required this.categoryType,
  });

  @override
  String toString() {
    return 'Categiry(id: $id, name: $name, assetImagePath: $assetImagePath, categoryType: $categoryType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.assetImagePath == assetImagePath &&
        other.categoryType == categoryType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        assetImagePath.hashCode ^
        categoryType.hashCode;
  }
}
