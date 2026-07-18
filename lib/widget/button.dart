import 'package:to_do/app_exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 40),
          backgroundColor: const Color(0xff15B86C),
          foregroundColor: const Color(0xffFFFCFC),
        ),
        child: Text(text),
      );
    }


    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon!,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 40),
        backgroundColor: const Color(0xff15B86C),
        foregroundColor: const Color(0xffFFFCFC),
      ),
    );
  }
}