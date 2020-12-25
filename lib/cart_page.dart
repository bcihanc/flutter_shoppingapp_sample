import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_shoppingapp_sample/models/ProductModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CartPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Builder(
        builder: (context) {
          return ValueListenableBuilder<Box<String>>(
              valueListenable: Hive.box<String>('carts').listenable(),
              builder: (context, box, child) {
                final ids = box?.values?.toList();

                if (ids.isEmpty && ids == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.deleteEmpty),
                        const SizedBox(height: 10),
                        Text('Your cart is empty.'),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                            itemBuilder: (_, index) {
                              final product = kALLPRODUCTS.firstWhere(
                                  (element) => element.id == ids[index]);
                              return ListTile(
                                contentPadding: const EdgeInsets.all(4),
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Hero(
                                        tag: product.imagePath,
                                        child: Image.asset(product.imagePath))),
                                title: Row(
                                  children: [
                                    Expanded(
                                        child: Text('${product.name}',
                                            maxLines: 1)),
                                    Text('\$${product.price}'),
                                  ],
                                ),
                                dense: true,
                                trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      await box.delete(product.id);
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                            const Icon(Icons.delete_forever),
                                            const SizedBox(width: 8),
                                            Text('Product removed')
                                          ])));
                                    }),
                              );
                            },
                            separatorBuilder: (_, __) => Divider(),
                            itemCount: ids.length),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        color: Theme.of(context).cardColor,
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: () {
                                  var sum = .0;
                                  for (final id in ids) {
                                    final product = kALLPRODUCTS.firstWhere(
                                        (element) => element.id == id);
                                    sum += product.price;
                                  }
                                  return Text(
                                    'Total : \$$sum',
                                    style: TextStyle(fontSize: 18),
                                  );
                                }()),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OutlineButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.credit_card),
                                  label: Text('Complete')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
