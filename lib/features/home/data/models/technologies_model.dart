class TechnologiesModel {
  int? id;
  int? technologyCategoryId;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  Null? videos;
  String? createdAt;
  String? updatedAt;

  TechnologiesModel(
      {this.id,
        this.technologyCategoryId,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.image,
        this.videos,
        this.createdAt,
        this.updatedAt});

  TechnologiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    technologyCategoryId = json['technology_category_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    videos = json['videos'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}