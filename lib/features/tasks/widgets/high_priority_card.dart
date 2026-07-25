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
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 40.w,
            ), // Leave space for the clickable shape
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "High Priority Tasks",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 4.h),
                if (highPriorityTasks.isEmpty)
                  Text(
                    "No high priority tasks",
                    style: Theme.of(context).textTheme.displaySmall,
                  )
                else
                  ...highPriorityTasks.reversed
                      .take(4)
                      .map(
                        (task) => Row(
                          children: [
                            Checkbox(
                              value: task.isDone,
                              activeColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              onChanged: (bool? newValue) {
                                onStatusChanged(task, newValue);
                              },
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                task.taskName,
                                style: task.isDone
                                    ? TextStyle(
                                        fontSize: 14.sp,
                                        color:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodySmall?.color ??
                                            const Color(0xFF6A6A6A),
                                        decoration: TextDecoration.lineThrough,
                                      )
                                    : TextStyle(
                                        fontSize: 14.sp,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          Positioned(
            bottom: -10.h,
            right: -10.w,
            child: GestureDetector(
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.r),
                ),
                child: SvgPicture.asset(
                  AppAssets.splashShapeBottomRight,
                  width: 50.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
