import 'package:to_do/app_exports.dart';

enum TaskAction { edit, delete }

class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final ValueChanged<bool?> onStatusChanged;
  final ValueChanged<TaskAction>? onActionSelected;

  const TaskListItem({
    super.key,
    required this.task,
    required this.onStatusChanged,
    this.onActionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        leading: Checkbox(
          value: task.isDone,
          activeColor: Theme.of(context).colorScheme.primary,
          onChanged: onStatusChanged,
        ),
        title: Text(
          task.taskName,
          style: task.isDone
              ? TextStyle(
                  color:
                      Theme.of(context).textTheme.bodySmall?.color ??
                      const Color(0xFF6A6A6A),
                  fontSize: 14.sp,
                  decoration: TextDecoration.lineThrough,
                )
              : TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16.sp,
                ),
        ),
        subtitle: task.taskDescription.isNotEmpty
            ? Text(
                task.taskDescription,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                ),
              )
            : null,
        trailing: PopupMenuButton<TaskAction>(
          onSelected: onActionSelected,
          itemBuilder: (_) => [
            const PopupMenuItem(value: TaskAction.edit, child: Text("Edit")),
            const PopupMenuItem(
              value: TaskAction.delete,
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
