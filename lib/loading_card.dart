import "package:flutter/material.dart";
import 'package:jumping_dot/jumping_dot.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
    this.title = "Monitoring Sensors",
    this.subtitle = "Do not move phone",
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            CustomCardStyle.borderRadius,
          ),
        ),
        color: CustomCardStyle.backgroundColor,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                visualDensity:
                    const VisualDensity(vertical: VisualDensity.minimumDensity),
                title: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: SizedBox(
                  width: 50,
                  height: 25,
                  child: JumpingDots(
                    color: Theme.of(context).colorScheme.primary,
                    radius: 5,
                    numberOfDots: 3,
                    animationDuration: const Duration(milliseconds: 250),
                    verticalOffset: 5,
                    delay: 800,
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    subtitle,
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
      ),
    );
  }
}

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

// class DotLoadingIndicator extends StatefulWidget {
//   const DotLoadingIndicator({Key? key}) : super(key: key);

//   @override
//   _DotLoadingIndicatorState createState() => _DotLoadingIndicatorState();
// }

// class _DotLoadingIndicatorState extends State<DotLoadingIndicator>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 4000),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
//     _controller!.repeat();
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation!,
//       builder: (_, __) {
//         return Text(
//           _getDots(_animation!.value),
//           style: TextStyle(fontSize: 24),
//         );
//       },
//     );
//   }

//   String _getDots(double animationValue) {
//     if (animationValue <= .50) {
//       return "  ";
//     } else if (animationValue <= .75) {
//       return ".  ";
//     } else if (animationValue <= .9) {
//       return ".. ";
//     } else {
//       return "...";
//     }
//   }
// }
