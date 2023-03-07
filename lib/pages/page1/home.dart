import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:effective_mobile_flutter_task/pages/page1/categories.dart';
import 'package:effective_mobile_flutter_task/pages/page1/header_products.dart';
import 'package:effective_mobile_flutter_task/pages/page1/item_product.dart';
import 'package:flutter/material.dart';
import 'mini_card_product.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late final MiniCardProduct _latestProductWidget, _flashSaleProductWidget;
  final hasAllData = ValueNotifier<double>(0);

  @override
  void initState() {
    _latestProductWidget = MiniCardProduct(
      typeItem: TypeItem.latest,
      hasAllData: hasAllData,
    );
    _flashSaleProductWidget = MiniCardProduct(
      typeItem: TypeItem.flashSale,
      hasAllData: hasAllData,
    );
    super.initState();
  }

  @override
  void dispose() {
    hasAllData.dispose();
    _latestProductWidget.canBuild.dispose();
    _flashSaleProductWidget.canBuild.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: context.color.otherItemColor,
                ),
                splashColor: Colors.transparent,
              ),
              Row(
                children: [
                  Text(
                    "Trade by ",
                    style: context.text.appBarTitle1,
                  ),
                  Text(
                    "bata",
                    style: context.text.appBarTitle2,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: context.color.otherItemColor,
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                  SizedBox(
                    height: 20,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 1),
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "Location",
                            style: context.text.labelText2,
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.chevron_right,
                              size: 15,
                              color: context.color.otherItemColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                cursorColor: context.color.otherItemColor,
                textAlign: TextAlign.center,
                style: context.text.textInput,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.color.textFieldBackgroundColor,
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: context.color.otherItemColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )
                  ),
                  hintText: "What are you looking for?",
                  hintStyle: context.text.hintTextInput,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Categories(),
            const SizedBox(height: 20),
            const HeaderProducts(title: "Latest"),
            SizedBox(
              height: 170,
              child: ValueListenableBuilder<double>(
                  valueListenable: hasAllData,
                  builder: (context, value, child) {
                    if (hasAllData.value == 1) {
                      _latestProductWidget.canBuild.value = true;
                    }
                    return _latestProductWidget;
                  }
              ),
            ),
            const SizedBox(height: 20),
            const HeaderProducts(title: "Flash Sale"),
            SizedBox(
              height: 300,
              child: ValueListenableBuilder<double>(
                  valueListenable: hasAllData,
                  builder: (context, value, child) {
                    if (hasAllData.value == 1) {
                      _flashSaleProductWidget.canBuild.value = true;
                    }
                    return _flashSaleProductWidget;
                  }
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Brands",
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
            ),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCardBrand("New balance", Colors.red, Colors.lime),
                  _buildCardBrand("Nike", Colors.blue, Colors.green),
                  _buildCardBrand("Reebok", Colors.yellow, Colors.deepOrangeAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardBrand(String name, Color start, Color end) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: 130,
          height: 170,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [start, end],
            ),
          ),
          child: Center(child: Text(name)),
        ),
      ),
    );
  }
}
