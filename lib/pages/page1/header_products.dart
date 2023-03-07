import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:flutter/material.dart';

class HeaderProducts extends StatelessWidget {

  final String title;
  const HeaderProducts({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.text.typeProductText,
          ),
          SizedBox(
            height: 20,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 1),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                "View all",
                style: context.text.labelText1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
