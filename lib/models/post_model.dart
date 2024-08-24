class PostModel {
   int userId;
  int id;
  String title;
  String body;
 
 
  



  PostModel({
     this.userId=0,
    this.id = 0,
    this.title = "",
    this.body="",
   
   
  });

  factory PostModel.fromJson(Map map) {
    return PostModel(
       userId:map["userId"],
        id: map["id"],
        title: map["title"],
        // price: double.parse(map["price"].toString()),
        body:map["body"],
       
        );
      
       
  }
}
