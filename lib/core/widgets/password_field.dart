import 'package:flutter/material.dart';
import 'package:fruits_apps/core/widgets/custom_text_form_field.dart';

class passwordField extends StatefulWidget {
  const passwordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: (value) {},
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
            : Icon(Icons.visibility_off,color: Color(0xffC9CECF),),
      ),
      hintText: ' كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
