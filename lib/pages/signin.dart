import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();

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
                  "Sign in",
                  style: context.text.authTitle,
                ),
                const SizedBox(height: 60),
                _buildTextField("First name"),
                const SizedBox(height: 25),
                _buildTextField("Last name"),
                const SizedBox(height: 25),
                _buildTextField("Email"),
                const SizedBox(height: 25),
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
                        const EdgeInsets.all(10),
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
                      "Sign in",
                      style: context.text.textMainButton,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: context.text.labelText1,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/log_in');
                      },
                      child: Text(
                        "Log in",
                        style: context.text.linkText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                TextButton.icon(
                  icon: SvgPicture.asset("assets/icons/google.svg"),
                  onPressed: () {
                    _showSnackBar(context, "Sign in with Google clicked");
                  },
                  label: Text(
                    "Sign in with Google",
                    style: context.text.additionalLoginText,
                  ),
                ),
                const SizedBox(height: 22),
                TextButton.icon(
                  icon: SvgPicture.asset("assets/icons/apple.svg"),
                  onPressed: () {
                    _showSnackBar(context, "Sign in with Apple clicked");
                  },
                  label: Text(
                    "Sign in with Apple",
                    style: context.text.additionalLoginText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextFormField _buildTextField(String hint) {
    return TextFormField(
      style: context.text.textInput,
      cursorColor: context.color.otherItemColor,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.color.textFieldBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )
        ),
        hintText: hint,
        hintStyle: context.text.hintTextInput,
        ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill in the $hint field";
        }
        if (hint == "Email" && !EmailValidator.validate(value)) {
          return "Invalid email";
        }
        return null;
      },
    );
  }
}
