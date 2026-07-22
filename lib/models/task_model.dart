class TaskModel {
  final String taskName;
  final String taskDescription;
  final bool isSwitch;
  bool isDone;

  TaskModel({
    required this.isSwitch,
    required this.taskDescription,
    required this.taskName,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json["taskName"] ?? json["name"] ?? "",
      taskDescription: json["taskDescription"] ?? json["desc"] ?? "",
      isSwitch: json["isHighPriority"] ?? json["isSwitch"] ?? false,
      isDone: json["isDone"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "taskName": taskName,
      "taskDescription": taskDescription,
      "isHighPriority": isSwitch,
      "isDone": isDone,
    };
  }

  Map<String, dynamic> toJson() => toMap();
}
