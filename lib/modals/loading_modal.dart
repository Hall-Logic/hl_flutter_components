import 'package:flutter/material.dart';

class LoadingModal extends StatelessWidget {
  const LoadingModal({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 350,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            const SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(),
            ),
            Text(
              body,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
