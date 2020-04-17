class ProjectEntity {
  String title;
  double num;
  bool isAdd;
  double changeNum;

  ProjectEntity({this.title, this.num, this.isAdd, this.changeNum});

  ProjectEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    num = json['num'];
    isAdd = json['isAdd'];
    changeNum = json['changeNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['num'] = this.num;
    data['isAdd'] = this.isAdd;
    data['changeNum'] = this.changeNum;
    return data;
  }
}
