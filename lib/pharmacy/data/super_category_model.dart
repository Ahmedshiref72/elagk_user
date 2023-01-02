class SuperCategoryModel {
  int? superCatgoryId;
  String? superCatgoryName;
  String? imageUrl;
  Null? image;
  String? createdAt;
  bool? isDeleted;

  SuperCategoryModel(
      {this.superCatgoryId,
        this.superCatgoryName,
        this.imageUrl,
        this.image,
        this.createdAt,
        this.isDeleted});

  SuperCategoryModel.fromJson(Map<String, dynamic> json) {
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
