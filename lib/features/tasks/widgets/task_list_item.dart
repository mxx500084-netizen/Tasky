import 'package:to_do/app_exports.dart';

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final ValueChanged<bool?> onStatusChanged;

  const TaskListItem({
    super.key,
    required this.task,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 4.h,
        ),
        leading: Checkbox(
          value: task.isDone,
          activeColor: AppColors.primaryGreen,
          onChanged: onStatusChanged,
        ),
        title: Text(
          task.taskName,
          style: TextStyle(
            color: task.isDone ? AppColors.disabledGrey : Colors.white,
            fontSize: 16.sp,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: task.taskDescription.isNotEmpty
            ? Text(
                task.taskDescription,
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 12.sp,
                ),
              )
            : null,
      ),
    );
  }
}
