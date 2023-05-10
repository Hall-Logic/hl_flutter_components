//card with an arrow on right side to expand to see full card contents
import 'package:flutter/material.dart';

class CustomCardStyle {
  static const double borderWidth = 1.0;
  static const Color borderColor = Colors.grey;
  static const double borderRadius = 10.0;
  static const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);

  static BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
    color: backgroundColor,
  );
}

class DropdownCard extends StatefulWidget {
  const DropdownCard({
    Key? key,
    required this.title,
    required this.child,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget child;

  @override
  _DropdownCardState createState() => _DropdownCardState();
}

class _DropdownCardState extends State<DropdownCard> {
  bool show = false;

  void toggleShow() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: show
          //show full card
          ? Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  CustomCardStyle.borderRadius,
                ),
              ),
              color: CustomCardStyle.backgroundColor,
              child: Column(
                children: [
                  CardTitle(context),
                  widget.child,
                ],
              ),
            )
          : Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  CustomCardStyle.borderRadius,
                ),
                // side: BorderSide(
                //   color: CustomCardStyle.borderColor,
                //   width: CustomCardStyle.borderWidth,
                // ),
              ),
              color: CustomCardStyle.backgroundColor,
              child: CardTitle(context),
            ),
    );
  }

  GestureDetector CardTitle(BuildContext context) {
    return GestureDetector(
      onTap: toggleShow,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              visualDensity:
                  const VisualDensity(vertical: VisualDensity.minimumDensity),
              title: Text(
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing:
                  Icon(show ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ),
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
