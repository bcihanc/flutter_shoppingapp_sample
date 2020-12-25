import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp_sample/models/ProductModel.dart';
import 'package:flutter_shoppingapp_sample/product_card.dart';
import 'package:flutter_shoppingapp_sample/shopping_app.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Hero(
            tag: product.name,
            // flightShuttleBuilder: _flightShuttleBuilder,
            child: Material(
                type: MaterialType.transparency,
                child: Text(
                  '${product.name}',
                  maxLines: 1,
                ))),
        centerTitle: false,
      ),
      body: Builder(
          builder: (context) => SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Hero(
                              tag: product.imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child:
                                    Image.asset(product.imagePath, height: 200),
                              )),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Hero(
                                  tag: product.price,
                                  child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        '\$${product.price}',
                                        style: TextStyle(fontSize: 32),
                                      ))),
                              const SizedBox(height: 10),
                              Hive.box<String>('carts').containsKey(product.id)
                                  ? Text('already in cart')
                                  : RaisedButton.icon(
                                      color: Colors.blueGrey,
                                      onPressed: () async {
                                        await Hive.box<String>('carts')
                                            .put(product.id, product.id);

                                        Navigator.pop(context);
                                        context
                                            .read(shoppingScaffoldState)
                                            .currentState
                                            .showSnackBar(SnackBar(
                                                content: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                  Icon(Icons.add_shopping_cart),
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                      child: Text(
                                                    'Product added to cart ${product.name}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                  ))
                                                ])));
                                      },
                                      icon: Icon(Icons.add_shopping_cart),
                                      label: Text('add to cart')),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${product.details}'),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: product.point,
                        child: FittedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
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
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: ListTile.divideTiles(
                              context: context,
                              tiles: product.comments
                                  .map((comment) => ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            '${comment.comment}',
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ),
                                        subtitle: Text('${comment.username}'),
                                        trailing: Text('${comment.point}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        dense: true,
                                        leading: Icon(MdiIcons.commentOutline),
                                      ))
                                  .toList())
                          .toList(),
                    ),
                  ],
                ),
              )),
    );
  }
}
