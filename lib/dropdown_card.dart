//card with an arrow on right side to expand to see full card contents
import 'package:animations/animations.dart';
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
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 500),
      closedColor: CustomCardStyle.backgroundColor,
      openColor: CustomCardStyle.backgroundColor,
      closedElevation: 5,
      openElevation: 5,
      closedBuilder: (context, openContainer) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CustomCardStyle.borderRadius,
            ),
          ),
          color: CustomCardStyle.backgroundColor,
          child: ListTile(
            onTap: openContainer,
            title: Text(
              widget.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: const Icon(Icons.arrow_drop_down),
          ),
        );
      },
      openBuilder: (context, closeContainer) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: closeContainer,
            ),
          ),
          body: widget.child,
        );
      },
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
