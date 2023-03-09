import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:effective_mobile_flutter_task/client.dart';

import '../db_provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final _formKey = GlobalKey<FormState>();
  late bool _passwordVisible = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout();
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
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
              _buildTextField('First name', _firstNameController),
              const SizedBox(height: 35),
              _buildTextField(
                  'Password',
                  _passwordController,
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
                  onPressed: _loginUser,
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
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Welcome back",
            style: context.text.authTitle,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField('First name', _firstNameController),
                  const SizedBox(height: 10),
                  _buildTextField(
                      'Password',
                      _passwordController,
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
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loginUser,
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
      ],
    );
  }

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showSnackBar(context, "Processing data...", Colors.deepOrangeAccent);
      });

      Client client = Client(
        firstName: _firstNameController.text,
        password: _passwordController.text,
      );

      Client? foundClient = await DBProvider.db.existClient(client);
      setState(() {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });

      if (foundClient != null) {
        setState(() {
          _showSnackBar(context, "Success", Colors.green);
          Navigator.pushNamedAndRemoveUntil(context, '/page1', (predicate) => false, arguments: foundClient);
        });
      } else {
        setState(() {
          _showSnackBar(context, "User ${client.firstName} is not exist", Colors.red);
        });
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

  TextFormField _buildTextField(String hint, TextEditingController controller,
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
      controller: controller,
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
