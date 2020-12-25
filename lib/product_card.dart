import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp_sample/models/ProductModel.dart';
import 'package:flutter_shoppingapp_sample/product_detail_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double size;

  const ProductCard({Key key, this.product, this.size = 180}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product)));
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: size,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: Hero(
                  tag: product.imagePath,
                  child: SizedBox(
                    height: size,
                    width: size,
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: product.name,
                        child: Material(
                            type: MaterialType.transparency,
                            child: Text('${product.name}', maxLines: 1))),
                    const SizedBox(height: 4),
                    Hero(
                        tag: product.price,
                        child: Material(
                            type: MaterialType.transparency,
                            child: Text('\$${product.price}'))),
                    const SizedBox(height: 4),
                    Hero(
                      tag: product.point,
                      child: FittedBox(
                        child: Row(
                          children: [
                            ReviewStars(
                              value: product.point / 5,
                              emptyColor: Colors.blueGrey,
                            ),
                            SizedBox(width: 4),
                            Material(
                              type: MaterialType.transparency,
                              child: Text(
                                '(${product.comments.length})',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewStars extends StatelessWidget {
  const ReviewStars(
      {Key key,
      @required this.value,
      this.size,
      this.fillColor = Colors.blueGrey,
      this.emptyColor,
      this.starCount = 5,
      this.icon})
      : assert(value != null, 'value must not be null'),
        assert(value >= 0 && value <= 1, 'value must be between 0 and 1'),
        super(key: key);

  // current value of rating
  final double value;

  // size of a single star
  final double size;

  // body color of star
  final Color fillColor;

  final Color emptyColor;

  // amount of stars
  final int starCount;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              starCount,
              (index) => Icon(
                    icon ?? Icons.star_outline,
                    size: size,
                    color: emptyColor,
                  )),
        ),
        ClipRect(
          child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: value,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      starCount,
                      (index) => Icon(icon ?? Icons.star,
                          size: size, color: fillColor)))),
        )
      ],
    );
  }
}
