import 'package:to_do/app_exports.dart';

import '../screens/High_Priority_screen.dart';

class HighPriorityCard extends StatelessWidget {
  final List<TaskModel> highPriorityTasks;
  final void Function(TaskModel task, bool? isDone) onStatusChanged;
  final VoidCallback? onNavigateBack;

   const HighPriorityCard({
    super.key,
    required this.highPriorityTasks,
    required this.onStatusChanged,
    this.onNavigateBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "High Priority Tasks",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryGreen,
                  ),
                ),
                SizedBox(height: 4.h),
                if (highPriorityTasks.isEmpty)
                  Text(
                    "No high priority tasks",
                    style: TextStyle(fontSize: 12.sp, color: AppColors.textGrey),
                  )
                else
                  ...highPriorityTasks.reversed
                      .take(4)
                      .map(
                        (task) => Row(
                          children: [
                            Checkbox(
                              value: task.isDone,
                              activeColor: AppColors.primaryGreen,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(horizontal: 4, vertical: 1),
                              onChanged: (bool? newValue) {
                                onStatusChanged(task, newValue);
                              },
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                task.taskName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HighPriorityScreen(),
                ),
              );
              if (onNavigateBack != null) {
                onNavigateBack!();
              }
            },
            child: SvgPicture.asset(AppAssets.splashShapeBottomRight, width: 50),
          ),
        ],
      ),
    );
  }
}
