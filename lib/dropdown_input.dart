//card with an arrow on right side to expand to see full card contents
import 'package:flutter/material.dart';

class CustomCardStyle {
  static const double borderWidth = 1.0;
  static const Color borderColor = Colors.grey;
  static const double borderRadius = 10.0;
  static const Color backgroundColor = Colors.transparent;

  static BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
    color: backgroundColor,
  );
}

class DropdownInput extends StatefulWidget {
  const DropdownInput({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
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
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  CustomCardStyle.borderRadius,
                ),
                side: BorderSide(
                  color: CustomCardStyle.borderColor,
                  width: CustomCardStyle.borderWidth,
                ),
              ),
              color: CustomCardStyle.backgroundColor,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: toggleShow,
                    child: ListTile(
                      visualDensity: const VisualDensity(
                          vertical: VisualDensity.minimumDensity),
                      title: Text(widget.title),
                      trailing: const Icon(Icons.arrow_drop_up),
                    ),
                  ),
                  widget.child,
                ],
              ),
            )
          : GestureDetector(
              onTap: toggleShow,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    CustomCardStyle.borderRadius,
                  ),
                  side: BorderSide(
                    color: CustomCardStyle.borderColor,
                    width: CustomCardStyle.borderWidth,
                  ),
                ),
                color: CustomCardStyle.backgroundColor,
                child: ListTile(
                  visualDensity: const VisualDensity(
                      vertical: VisualDensity.minimumDensity),
                  title: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
    );
  }
}
