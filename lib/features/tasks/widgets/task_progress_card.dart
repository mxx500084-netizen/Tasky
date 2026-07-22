import 'dart:math';
import 'package:to_do/app_exports.dart';

class TaskProgressCard extends StatelessWidget {
  final int total;
  final int done;
  final double present;

  const TaskProgressCard({
    super.key,
    required this.present,
    required this.done,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Achieved Tasks",
                  color: AppColors.textWhite,
                ),
                Gap(4.h),
                CustomText(
                  text: "$done Out of $total Done",
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: -pi / 2,
                  child: CircularProgressIndicator(
                    value: present,
                    strokeWidth: 7,
                    strokeAlign: 3,
                    color: AppColors.primaryGreen,
                    backgroundColor: Colors.white,
                  ),
                ),
                CustomText(
                  text: "${(present * 100).toInt()}%",
                  color: AppColors.textWhite,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
