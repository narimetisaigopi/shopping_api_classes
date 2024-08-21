class GalaxyModel {
  int userId;
  int id;
  String title;
  bool completed;

  GalaxyModel({
required  this.userId,
 required this.id,
   required this.title,
  required this.completed,
});

factory GalaxyModel.fromJson(Map json){
  return GalaxyModel(
  userId:json["userId"],
  id:json["id"],
  title:json["title"],
  completed:json["completed"],
);
}

}

