import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ButtonBar(
          buttonPadding: const EdgeInsets.all(1),
          children: [
            CategoryButton(
                icon: Icon(MdiIcons.electronFramework),
                color: Colors.red,
                label: 'Electronic'),
            const SizedBox(width: 10),
            CategoryButton(
                icon: Icon(MdiIcons.home), color: Colors.blue, label: 'Home'),
            const SizedBox(width: 10),
            CategoryButton(
                icon: Icon(MdiIcons.dresser),
                color: Colors.green,
                label: 'Fashion'),
            const SizedBox(width: 10),
            CategoryButton(
                icon: Icon(MdiIcons.music),
                color: Colors.amber,
                label: 'Music'),
            const SizedBox(width: 10),
            CategoryButton(
                icon: Icon(MdiIcons.artstation),
                color: Colors.deepPurple,
                label: 'Arts'),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String label;

  const CategoryButton({Key key, this.icon, this.color, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      color: color,
      borderSide: BorderSide(color: color),
      textColor: color,
      icon: icon,
      label: Text('$label'),
      onPressed: () {},
    );
  }
}
