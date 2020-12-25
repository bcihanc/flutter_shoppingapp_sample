import 'package:flutter/foundation.dart';

@immutable
class ProductCommentModel {
  const ProductCommentModel({this.username, this.comment, this.point});

  final String username;
  final String comment;
  final double point;
}

@immutable
class ProductModel {
  const ProductModel(
      {@required this.id,
      this.name,
      this.details,
      this.imagePath,
      this.price,
      this.comments});

  final String id;
  final String name;
  final String details;
  final String imagePath;
  final double price;
  final List<ProductCommentModel> comments;

  double get point {
    final sum = comments.map((comment) => comment.point);
    final average = sum.reduce((a, b) => a + b);
    return average / (comments.length);
  }
}

final kALLPRODUCTS = [...kALLPRODUCTSTOP, ...kALLPRODUCTSBOTTOM];

final kALLPRODUCTSTOP = [
  ProductModel(
    id: '1',
    name: 'New Apple iPhone 12 (64GB, Black) [Locked] + Carrier Subscription',
    details:
        'Blast past fast. 5G speed. A14 Bionic, the fastest chip in a smartphone. An edge-to-edge OLED display. Ceramic Shield with four times better drop performance. And Night mode on every camera. iPhone 12 has it all — in two perfect sizes.',
    imagePath: 'assets/images/iphone12.jpg',
    price: 829.00,
    comments: [
      ProductCommentModel(
          username: 'Xaniel Puffman',
          point: 5,
          comment:
              'I think personally that it is a good upgrade compared to the iPhone 11 from what people are saying that there phone broke after falling off the bed really'),
      ProductCommentModel(
          username: 'Ryan',
          point: 4,
          comment:
              'iPhone is great but not really white. Is an off white with a pink hue. I sent mine back and got the blue.'),
      ProductCommentModel(
          username: 'Mike',
          point: 4,
          comment: 'This phone is a phone. I think. Phone.')
    ],
  ),
  ProductModel(
    id: '2',
    name:
        'Stainless Steel Portable Fast, Electric Hot Water Kettle for Tea and Coffee, 1 Liter, Silver',
    details:
        'Quickly boil up to 1 liter of water with the Electric Kettle. The 1500-watt unit brings water to a rolling boil in a matter of minutes—no need for a slow stovetop or noisy microwave oven.',
    imagePath: 'assets/images/kettle.jpg',
    price: 21.99,
    comments: [
      ProductCommentModel(
          username: 'Customer',
          point: 1,
          comment:
              'DO NOT BUY!!! This pot just did a meltdown. Fire department had to be called to get the smoke out of the house.'),
      ProductCommentModel(
          username: 'Hannah', point: 2, comment: 'Rust on the bottom.'),
      ProductCommentModel(
          username: 'Saltman',
          point: 3,
          comment:
              'Water boiled in this definitely has a metallic taste. Im returning it and ordering a better quality glass kettle.'),
      ProductCommentModel(
          username: 'John',
          point: 4,
          comment:
              'This seemed like a great deal and I like the small size, which is good for a quick cup of tea or pourover at the office.')
    ],
  ),
  ProductModel(
    id: '3',
    name:
        'Premium Double Nylon Braided Lightning to USB Cable - MFi Certified Apple iPhone Charger, Dark Gray, 6-Foot',
    details:
        'Enjoy accelerated charging and quick synching with the  Premium Collection Double Nylon Braided Lightning to USB A Cable. This essential cord is designed for use with USB-A compatible.',
    imagePath: 'assets/images/cable.jpg',
    price: 16.99,
    comments: [
      ProductCommentModel(
          username: 'George',
          point: 5,
          comment:
              'Like the gray color and heavy duty look. Much nicer connection to car USB now.'),
      ProductCommentModel(
          username: 'Bill',
          point: 5,
          comment:
              'This cord is just what I was looking for! It’s durable, thick and works for charging my iPhone! '),
    ],
  )
];

final kALLPRODUCTSBOTTOM = [
  ProductModel(
      id: '4',
      details:
          'Same classic Kanken design since 1978. Stash everyday essentials in the main zippered compartment, front zippered pocket, and two open side pockets.',
      name: 'Fjallraven, Kanken Classic Backpack for Everyday',
      imagePath: 'assets/images/bag.jpg',
      price: 79.49,
      comments: [
        ProductCommentModel(
            username: 'Timmy',
            point: 4.2,
            comment:
                'I recently bought a Fjallraven bag from Urban Outfitters and wanted to buy my friend one for her birthday.'),
        ProductCommentModel(
            username: 'Grace',
            point: 4.5,
            comment:
                'This has become a fashion item for middle-school girls. As a backpack it’s of limited usefulness.'),
        ProductCommentModel(
            username: 'Honey',
            point: 5,
            comment:
                'I got another real one! I bought this to have as a minimalist diaper bag and it’s just as perfect as I hoped.'),
      ]),
  ProductModel(
      id: '5',
      name:
          'Kitchen Storage Bakers Rack with Wood Table, Chrome/Wood - 63.4 Height',
      details:
          'Create instantly functional, stylish storage space with the Kitchen Baker’s Rack.',
      imagePath: 'assets/images/rack.jpg',
      price: 69.99,
      comments: [
        ProductCommentModel(
            username: 'Kalin',
            point: 5,
            comment:
                'Amazing. So much better than expected. Hint: to add the appearance of height, place taller small appliances on the top shelf.'),
        ProductCommentModel(
            username: 'Lisa',
            point: 4.7,
            comment:
                'I purchased this bakers rack after spending 300 on a smaller fake looking bakers rack that took me 5 hours to put together.'),
        ProductCommentModel(
            username: 'Gabriel',
            point: 4.2,
            comment:
                'After putting it together and putting stuff on it my anger with the delivery issue dissappeared. The rack is easy to install and its perfect for what I need it.'),
      ]),
];
