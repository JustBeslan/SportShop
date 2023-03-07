import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:effective_mobile_flutter_task/db_provider.dart';
import 'package:effective_mobile_flutter_task/client.dart';
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
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
                _buildTextField("First name", _firstNameController),
                const SizedBox(height: 25),
                _buildTextField("Last name", _lastNameController),
                const SizedBox(height: 25),
                _buildTextField("Email", _emailController),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _signinUser,
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

  Future<void> _signinUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showSnackBar(context, "Processing data...", Colors.deepOrangeAccent);
      });

      Client client = Client(
        firstName: _firstNameController.text,
        password: "",
      );
      client.lastName = _lastNameController.text;
      client.email = _emailController.text;

      if (client.password.isEmpty) {
        client.password = client.email!.substring(0, client.email!.indexOf('@'));
        if (client.password.isEmpty) client.password = client.firstName;
      }

      dynamic foundClient = await DBProvider.db.existClient(client);
      setState(() {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });

      if (foundClient != null) {
        setState(() {
          _showSnackBar(context, "User ${client.firstName} already exist", Colors.red);
        });
      } else {
        setState(() {
          _showSnackBar(context, "Registering user ${client.firstName}...", Colors.deepOrangeAccent);
        });
        bool isSuccess = (await DBProvider.db.newClient(client)) != 0;
        if (isSuccess) {
          setState(() {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _showSnackBar(context, "Success", Colors.green);
            Navigator.pushNamedAndRemoveUntil(context, '/page1', (predicate) => false);
          });
        }
      }
    }
  }

  void _showSnackBar(BuildContext context, String message, [Color backgroundColor = Colors.black]) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextFormField _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
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
