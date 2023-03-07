import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
              SvgPicture.asset("assets/icons/main_page/phone.svg"),
              "Phones"),
          _buildItem(
              SvgPicture.asset("assets/icons/main_page/headphone.svg"),
              "Headphones"),
          _buildItem(
              SvgPicture.asset("assets/icons/main_page/game.svg"),
              "Games"),
          _buildItem(
              SvgPicture.asset("assets/icons/main_page/car.svg"),
              "Cars"),
          _buildItem(
              SvgPicture.asset("assets/icons/main_page/furniture.svg"),
              "Furniture"),
          _buildItem(
              SvgPicture.asset("assets/icons/main_page/robot.svg"),
              "Kids"),
        ],
      ),
    );
  }

  Column _buildItem(SvgPicture icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
            backgroundColor: context.color.buttonIconColor,
          ),
          child: icon,
        ),
        Text(text, style: context.text.labelText1),
      ],
    );
  }
}
