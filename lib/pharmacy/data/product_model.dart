class ProductsModel {
  String? userId;
  int? pharmacyId;
  int? productId;
  String? productName;
  String? description;
  int? price;
  int? discountPercent;
  String? imageUrl;
  String? image;
  int? point;
  int? categoryId;
  List<Categories>? categories;
  String? categoryName;
  int? quantity;
  String? dose;
  String? createdAt;

  ProductsModel(
      {this.userId,
        this.pharmacyId,
        this.productId,
        this.productName,
        this.description,
        this.price,
        this.discountPercent,
        this.imageUrl,
        this.image,
        this.point,
        this.categoryId,
        this.categories,
        this.categoryName,
        this.quantity,
        this.dose,
        this.createdAt});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    pharmacyId = json['pharmacyId'];
    productId = json['productId'];
    productName = json['productName'];
    description = json['description'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    imageUrl = json['imageUrl'];
    image = json['image'];
    point = json['point'];
    categoryId = json['categoryId'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    categoryName = json['categoryName'];
    quantity = json['quantity'];
    dose = json['dose'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['pharmacyId'] = this.pharmacyId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercent'] = this.discountPercent;
    data['imageUrl'] = this.imageUrl;
    data['image'] = this.image;
    data['point'] = this.point;
    data['categoryId'] = this.categoryId;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['categoryName'] = this.categoryName;
    data['quantity'] = this.quantity;
    data['dose'] = this.dose;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Categories {
  int? categoryId;
  String? categoryName;
  String? imageUrl;
  String? image;
  String? createdAt;
  int? superCategoryId;
  SuperCategory? superCategory;

  Categories(
      {this.categoryId,
        this.categoryName,
        this.imageUrl,
        this.image,
        this.createdAt,
        this.superCategoryId,
        this.superCategory});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    imageUrl = json['imageUrl'];
    image = json['image'];
    createdAt = json['createdAt'];
    superCategoryId = json['superCategoryId'];
    superCategory = json['superCategory'] != null
        ? new SuperCategory.fromJson(json['superCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['imageUrl'] = this.imageUrl;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['superCategoryId'] = this.superCategoryId;
    if (this.superCategory != null) {
      data['superCategory'] = this.superCategory!.toJson();
    }
    return data;
  }
}

class SuperCategory {
  int? superCatgoryId;
  String? superCatgoryName;
  String? imageUrl;
  String? image;
  String? createdAt;
  bool? isDeleted;

  SuperCategory(
      {this.superCatgoryId,
        this.superCatgoryName,
        this.imageUrl,
        this.image,
        this.createdAt,
        this.isDeleted});

  SuperCategory.fromJson(Map<String, dynamic> json) {
    superCatgoryId = json['superCatgoryId'];
    superCatgoryName = json['superCatgoryName'];
    imageUrl = json['imageUrl'];
    image = json['image'];
    createdAt = json['createdAt'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['superCatgoryId'] = this.superCatgoryId;
    data['superCatgoryName'] = this.superCatgoryName;
    data['imageUrl'] = this.imageUrl;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
