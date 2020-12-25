import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shoppingapp_sample/cart_page.dart';
import 'package:flutter_shoppingapp_sample/category_bar.dart';
import 'package:flutter_shoppingapp_sample/models/ProductModel.dart';
import 'package:flutter_shoppingapp_sample/product_card.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final shoppingScaffoldState = Provider((_) => GlobalKey<ScaffoldState>());

class ShoppingApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read(shoppingScaffoldState),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text('Shopzone'),
        leading: Icon(MdiIcons.shopping),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Column(children: [
          const SizedBox(height: 10),
          Icon(Icons.shopping_cart_rounded, color: Colors.white),
          ValueListenableBuilder<Box<String>>(
              valueListenable: Hive.box<String>('carts').listenable(),
              builder: (context, box, child) {
                final cartLength = box.length ?? 0;
                return Text('$cartLength',
                    style: TextStyle(color: Colors.white));
              })
        ]),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                width: double.maxFinite,
                child: Card(
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.search), onPressed: () {}),
                      Expanded(
                          child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search...'))),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CategoryBar(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: kALLPRODUCTSTOP
                          .map((product) => ProductCard(
                                product: product,
                              ))
                          .toList(),
                    ),
                  ),
                  Banner(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: kALLPRODUCTSBOTTOM
                          .map((product) => ProductCard(
                                product: product,
                                size: 190,
                              ))
                          .toList())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        child: Card(
          color: Colors.blueGrey.withOpacity(0.4),
          child: Center(
            child: Icon(MdiIcons.percent, size: 64),
          ),
        ),
      ),
    );
  }
}
