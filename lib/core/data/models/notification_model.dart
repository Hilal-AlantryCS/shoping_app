class NotifictionModel {
  String? notifctionType;
  String? title;
  String? text;
  int? productId;

  NotifictionModel(
      {this.notifctionType, this.title, this.text, this.productId});

  NotifictionModel.fromJson(Map<String, dynamic> json) {
    notifctionType = json['notifction_type'];
    title = json['title'];
    text = json['text'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifction_type'] = this.notifctionType;
    data['title'] = this.title;
    data['text'] = this.text;

    return data;
  }
}
