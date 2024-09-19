class MessagesModel {
  String? message;
  String? userName;
  String? image;
  String? time;
  bool? isActive;
  String? id;
  MessagesModel(
      {this.message,
      this.userName,
      this.image,
      this.time,
      this.isActive,
      this.id});
  MessagesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userName = json['userName'];
    image = json['image'];
    time = json['time'];
    isActive = json['isActive'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() => {
        "message": message,
        "userName": userName,
        "image": image,
        "time": time,
        "isActive": isActive,
        "id": id
      };
}
