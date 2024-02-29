class PostInfo {
  String? userId;
  int? id;
  String? title;
  String? body;

  PostInfo({this.userId, this.id, this.title, this.body});

  PostInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'].toString();
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
