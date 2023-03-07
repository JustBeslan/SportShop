import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:effective_mobile_flutter_task/pages/page1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'profile.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text('Favorite'),
    Text('Cart'),
    Text('Chat'),
    Profile(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              _buildItem(SvgPicture.asset("assets/icons/home.svg"), "Home"),
              _buildItem(SvgPicture.asset("assets/icons/heart.svg"), "Heart"),
              _buildItem(SvgPicture.asset("assets/icons/cart.svg"), "Cart"),
              _buildItem(SvgPicture.asset("assets/icons/chat.svg"), "Chat"),
              _buildItem(SvgPicture.asset("assets/icons/profile.svg"), "Profile"),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(Widget icon, String text) {
    return BottomNavigationBarItem(
        icon: icon,
        activeIcon: CircleAvatar(
          radius: 20,
          backgroundColor: context.color.buttonIconColor,
          child: icon,
        ),
        label: text
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
