import 'package:to_do/app_exports.dart';

class Textform extends StatelessWidget {
  const Textform({
    super.key,
    required this.controller1,
    required this.validator,
    required this.color,
    this.maxLines = 1,
    required this.text,
  });

  final TextEditingController? controller1;
  final FormFieldValidator<String?>? validator;
  final Color color;
  final int maxLines;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller1,
      maxLines: maxLines,
      style: TextStyle(color: color),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: text,
        filled: true,
        fillColor: const Color(0xff282828),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
