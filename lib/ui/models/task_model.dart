
class TaskModel {
  final String title;
  final String descr;

  TaskModel({
    required this.title,
    required this.descr,
  });

  factory TaskModel.fromMap(Map<String, dynamic> json) => new TaskModel(
        title: json["title"],
        descr: json["descr"],
      );
}
