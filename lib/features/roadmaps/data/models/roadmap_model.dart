class RoadMapModel {
  int? id;
  int? expertId;
  int? technologyLevelId;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  String? cover;
  Null introductoryVideo;
  Null targetCv;
  String? createdAt;
  String? updatedAt;

  RoadMapModel(
      {this.id,
      this.expertId,
      this.technologyLevelId,
      this.title,
      this.titleAr,
      this.description,
      this.descriptionAr,
      this.cover,
      this.introductoryVideo,
      this.targetCv,
      this.createdAt,
      this.updatedAt});

  RoadMapModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expertId = json['expert_id'];
    technologyLevelId = json['technology_level_id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    cover = json['cover'];
    introductoryVideo = json['introductory_video'];
    targetCv = json['target_cv'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  
}