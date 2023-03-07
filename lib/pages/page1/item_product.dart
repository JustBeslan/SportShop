import 'package:effective_mobile_flutter_task/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:effective_mobile_flutter_task/product.dart';

enum TypeItem { latest, flashSale }

class ItemProduct extends StatelessWidget {

  final Product product;
  final TypeItem typeItem;
  const ItemProduct({
    super.key,
    required this.typeItem,
    this.product=const Product(
        category: "...",
        name: "...",
        price: 0,
        imageUrl: "")
  });

  Widget _getCircleButton(BuildContext context, double? width, double? height, Widget icon) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: context.color.backgroundInfoTextOnCardProductColor,
          padding: const EdgeInsets.symmetric(vertical: 1),
        ),
        child: icon,
      ),
    );
  }

  Widget _getRoundedText(Widget text, Color? backgroundColor) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          child: text,
        ),
      ),
    );
  }

  Widget _getInfoProductWidget(BuildContext context, double? widthName, Widget textName, Widget textCategory, Widget textPrice) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getRoundedText(
          textCategory,
          context.color.backgroundInfoTextOnCardProductColor,
        ),
        SizedBox(
          width: widthName,
          child: textName,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: textPrice,
        ),
      ],
    );
  }

  Widget _getGeneralContentItemProduct(BuildContext context, double? width, double? height, List<Widget> children) {
    return Stack(
      children: [
        product.imageUrl.isEmpty ?
        Positioned.fill(
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: context.color.otherTextOnBackgroundColor,
              color: context.color.otherItemColor,
            ),
          ),
        ) :
        Image.network(
          product.imageUrl,
          width: width,
          height: height,
        ),
        Container(
          width: width,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                context.color.startGradientOnCardProductColor,
                Colors.transparent,
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _getContentItemLatestProduct(BuildContext context) {
    final children = [
      _getInfoProductWidget(context, 65,
        Text(
          product.name,
          style: context.text.nameProductText.copyWith(
            fontSize: 12,
          ),
        ),
        Text(
          product.category,
          style: context.text.categoryProductText.copyWith(
            fontSize: 8,
          ),
        ),
        Text(
          "\$ ${product.price.toString()}",
          style: context.text.priceProductText.copyWith(
            fontSize: 9,
          ),
        ),
      ),
    ];

    if (product.imageUrl.isNotEmpty) {
      children.add(_getCircleButton(context, 30, 30, Icon(Icons.add, color: context.color.otherItemColor, size: 15)));
    }

    return _getGeneralContentItemProduct(context, 130, 170, children);
  }

  Widget _getContentItemFlashSaleProduct(BuildContext context) {
    final children = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/icons/main_page/flashSaleMarker.svg",
            width: 25,
            height: 25,
            allowDrawingOutsideViewBox: true,
          ),
          _getInfoProductWidget(context, 120,
            Text(
              product.name,
              style: context.text.nameProductText,
            ),
            Text(
              product.category,
              style: context.text.categoryProductText,
            ),
            Text(
              "\$ ${product.price.toString()}",
              style: context.text.priceProductText,
            ),
          ),
        ],
      ),
    ];

    if (product.imageUrl.isNotEmpty) {
      children.add(Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getRoundedText(
            Text(
              "${product.discount}% off",
              style: context.text.priceProductText,
            ),
            Colors.red,
          ),
          Row(
            children: [
              _getCircleButton(context, 35, 35, SvgPicture.asset('assets/icons/heart.svg')),
              const SizedBox(width: 5),
              _getCircleButton(context, 40, 40, Icon(Icons.add, color: context.color.otherItemColor, size: 25)),
            ],
          ),
        ],
      ));
    }

    return _getGeneralContentItemProduct(context, 230, 300, children);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: typeItem == TypeItem.latest
              ? _getContentItemLatestProduct(context)
              : _getContentItemFlashSaleProduct(context),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
