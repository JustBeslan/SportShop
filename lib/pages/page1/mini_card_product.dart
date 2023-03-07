import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:effective_mobile_flutter_task/pages/page1/item_product.dart';
import 'package:effective_mobile_flutter_task/product.dart';

class MiniCardProduct extends StatelessWidget {

  final canBuild = ValueNotifier(false);
  final ValueNotifier<double> hasAllData;
  late final typeItem;
  late final List<Product> _products;

  MiniCardProduct({super.key, required this.typeItem, required this.hasAllData });

  @override
  Widget build(BuildContext context) {
    FutureBuilder<List<Product>> futureBuilder = FutureBuilder<List<Product>>(
        future: Products.getData(typeItem),
        builder: (context, snapshot) => _listBuilder(context, snapshot)
    );
    futureBuilder.future?.then((value) => {
      if (hasAllData.value < 1) {
        hasAllData.value += value.isNotEmpty ? 0.5 : 0,
      },
      value
    });

    return futureBuilder;
  }

  Widget _listBuilder(BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
    if (snapshot.hasData) {
      _products = snapshot.data!;
      return ValueListenableBuilder<bool>(
        valueListenable: canBuild,
        builder: (context, value, child) {
          if (canBuild.value) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return ItemProduct(
                    product: _products[index],
                    typeItem: typeItem,
                  );
                }
            );
          }
          return ItemProduct(typeItem: typeItem,);
        },
      );
    } else if (snapshot.hasError) {
      //   Future(() {
      //     _showDialog(context,
      //       const Text("Error"),
      //       Text(snapshot.error.toString()),
      //       [
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: const Color.fromARGB(255, 78, 85, 215),
      //             padding: const EdgeInsets.all(12),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //           ),
      //           onPressed: (){
      //             Navigator.of(context).pop();
      //           },
      //           child:  const Text("Ok"),
      //         ),
      //       ],
      //     );
      //   });
      //   return ItemProduct(typeItem: _typeItem,);
    }
    return ItemProduct(typeItem: typeItem,);
  }
}
