import 'package:flutter/material.dart';
import 'package:hl_flutter_components/modals/info_modal.dart';

class CalibrationSenseModal extends StatelessWidget {
  const CalibrationSenseModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InfoModal(
      body:
          "This tool uses your phone's sensors and vehicle suspension stiffness to automatically calculate tongue weight",
      image: "assets/phone_angle.png",
      imagePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      // subBody: "TONGUE WEIGHT INFO",
      buttonText: "DISMISS",
    );
  }
}
