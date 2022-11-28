class Products {
  List<Product> product = <Product>[];

  Products({required this.product});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product.map((v) => v.toJson()).toList();
    return data;
  }
}

class Product {
  int? id;
  String? genericName;
  String name = "";
  String? category;
  String? location;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.genericName,
      required this.name,
      this.category,
      this.location,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genericName = json['genericName'];
    name = json['name'];
    category = json['category'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['genericName'] = genericName;
    data['name'] = name;
    data['category'] = category;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
