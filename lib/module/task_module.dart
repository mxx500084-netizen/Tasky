class TaskModule {
  final String  taskName;
  final String taskDescription;
  final bool isSwitch;
   bool isDone;


  TaskModule({required this.isSwitch,required this.taskDescription,required this.taskName,  this.isDone=false});
factory TaskModule.fromjson(Map<String, dynamic> json){
  return TaskModule(
    isSwitch: json["isHighPriority"] ?? false,
    taskDescription: json["taskDescription"] ?? "",
    taskName: json["taskName"] ?? "",
    isDone: json["isDone"] ?? false,
  );
}
Map<String,dynamic>toMap(){
  return {"taskName": taskName,
    "taskDescription": taskDescription,
    "isHighPriority": isSwitch,
    "isDone":isDone,
  };
}}
