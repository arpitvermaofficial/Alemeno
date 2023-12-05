class TestModel {
  late String name;
  late String newPrice;
  late String oldPrice;
  late String tests;

  TestModel({required this.name, required this.newPrice, required this.oldPrice, required this.tests});

  TestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    newPrice = json['newPrice'];
    oldPrice = json['oldPrice'];
    tests = json['tests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['newPrice'] = this.newPrice;
    data['oldPrice'] = this.oldPrice;
    data['tests'] = this.tests;
    return data;
  }
}
