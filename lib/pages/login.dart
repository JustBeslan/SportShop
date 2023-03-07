import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome back",
                  style: context.text.authTitle,
                ),
                const SizedBox(height: 70),
                _buildTextField('First name'),
                const SizedBox(height: 35),
                _buildTextField(
                  'Password',
                  IconButton(
                    icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                      },
                  ),
                  _passwordVisible
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamedAndRemoveUntil(context, '/page1', (predicate) => false);
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(20),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        context.color.mainButtonBackgroundColor,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: context.text.textMainButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(String hint,
      [IconButton? suffixIcon, bool isVisibleText = true]) {

    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        )
    );

    InputDecoration inputDecoration = InputDecoration(
      filled: true,
      fillColor: context.color.textFieldBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      border: outlineInputBorder,
      hintText: hint,
      hintStyle: context.text.hintTextInput,
      suffixIcon: suffixIcon,
      suffixIconColor: context.color.otherItemColor,
    );

    return TextFormField(
      obscureText: !isVisibleText,
      style: context.text.textInput,
      cursorColor: context.color.otherItemColor,
      textAlign: TextAlign.center,
      decoration: inputDecoration,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill in the $hint field";
        }
        return null;
      },
    );
  }
}
