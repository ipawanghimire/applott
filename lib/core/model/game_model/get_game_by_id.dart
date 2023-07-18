class GameByID {
  String? id;
  String? name;
  String? detail;
  String? prize;
  String? ratingsAverage;
  String? ratingsQuantity;
  String? rules;
  String? video;
  List<String>? images;
  String? otherDetails;

  GameByID({
    this.id,
    this.name,
    this.detail,
    this.prize,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.rules,
    this.video,
    this.images,
    this.otherDetails,
  });

  GameByID.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    detail = json['detail'].toString();
    prize = json['prize'].toString();
    ratingsAverage = json['ratingsAverage']?.toString();
    ratingsQuantity = json['ratingsQuantity']?.toString();
    rules = json['rules'].toString();
    video = json['video'].toString();
    // Convert the List<dynamic> to List<String>
    images = (json['images'] as List<dynamic>)
        .map((image) => image.toString())
        .toList();
    otherDetails = json['otherDetails'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['prize'] = this.prize;
    data['ratingsAverage'] = this.ratingsAverage;
    data['ratingsQuantity'] = this.ratingsQuantity;
    data['rules'] = this.rules;
    data['video'] = this.video;
    data['images'] = this.images;
    data['otherDetails'] = this.otherDetails;
    return data;
  }
}
