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

class _DropdownCardState extends State<DropdownCard>
    with SingleTickerProviderStateMixin {
  bool show = false;
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _arrowAnimation = Tween(begin: 0.0, end: 0.5).animate(_sizeAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleShow() {
    setState(() {
      show = !show;
      show ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
          SizeTransition(
            sizeFactor: _sizeAnimation,
            axisAlignment: 0.0,
            child: widget.child,
          ),
        ],
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
              trailing: RotationTransition(
                turns: _arrowAnimation,
                child: const Icon(Icons.arrow_drop_down),
              ),
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
