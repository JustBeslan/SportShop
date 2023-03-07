import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:effective_mobile_flutter_task/client.dart';
import 'package:effective_mobile_flutter_task/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  // const Profile({Key? key}) : super(key: key);

  final Client client;
  const Profile({super.key, required this.client});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late final Client client;

  @override
  Widget build(BuildContext context) {

    client = widget.client;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Profile",
          style: context.text.appBarTitle1,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: context.color.otherItemColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset('assets/images/avatar.png'),
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
                      child: Text("Change photo",
                        style: context.text.labelText1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${client.firstName} ${client.lastName}",
                      // "Satria Adhi Pradana",
                      textAlign: TextAlign.center,
                      style: context.text.itemMenuText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: context.color.mainButtonBackgroundColor,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      icon: const Icon(Icons.file_upload_outlined, size: 15,),
                      label: Text(
                        "Upload item",
                        style: context.text.textMainButton,
                      ),
                      onPressed: () {  },
                    ),
                  ),
                ],
              ),
              _buildMenuItem(context, "Trade store", SvgPicture.asset('assets/icons/profile_page/credit_card.svg')),
              _buildMenuItem(context, "Payment method", SvgPicture.asset('assets/icons/profile_page/credit_card.svg')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.color.buttonIconColor,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset('assets/icons/profile_page/credit_card.svg'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Balance",
                          style: context.text.itemMenuText,
                        ),
                      ],
                    ),
                    Text(
                      "\$ 1593",
                      style: context.text.itemMenuText,
                    ),
                  ],
                ),
              ),
              _buildMenuItem(context, "Trade history", SvgPicture.asset('assets/icons/profile_page/credit_card.svg')),
              _buildMenuItem(context, "Restore Purchase", SvgPicture.asset('assets/icons/profile_page/restore.svg')),
              _buildMenuItem(context, "Help", Icon(Icons.help_outline, color: context.color.otherItemColor), false),
              _buildMenuItem(context, "Log out", const Icon(Icons.login), false,
                      () => _showDialog(
                          context,
                          const Text("Are you sure?"),
                          const Text("Do you want to log out of your profile?"),
                          [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.color.mainButtonBackgroundColor,
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child:  const Text("Cancel"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.color.mainButtonBackgroundColor,
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pushNamedAndRemoveUntil(context, "/sign_in", (route) => false);
                              },
                              child: const Text("Log out"),
                            ),
                          ]
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String text, Widget icon, [bool hasArrow = true, Function()? onPressed]) {

    List<Widget> children = [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.color.buttonIconColor,
            ),
            padding: const EdgeInsets.all(10),
            child: icon,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: context.text.itemMenuText,
          ),
        ],
      ),
    ];

    if (hasArrow) {
      children.add(Icon(
        Icons.keyboard_arrow_right,
        size: 30,
        color: context.color.otherItemColor,
      ));
    }

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: context.color.otherItemColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Future _showDialog(BuildContext context,
      Widget title, Widget content, List<Widget> actions) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  }
}
