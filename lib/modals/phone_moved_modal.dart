import 'package:flutter/material.dart';
import 'package:hl_flutter_components/bw_button.dart';

class PhoneMovedModal extends StatelessWidget {
  const PhoneMovedModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 275,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Disturbance Detected",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
            const Text(
                "\nLeave phone on floor mat\nDo not touch phone while sensors gather data\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18)),
            BWButton(
              onPressed: () {
                Navigator.pop(context);
              },
              buttonText: "TRY AGAIN",
            ),
          ],
        ),
      ),
    );
  }
}
