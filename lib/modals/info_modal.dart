import 'package:flutter/material.dart';
import 'package:hl_flutter_components/bw_button.dart';

void _showLoadingModal() {}

class InfoModal extends StatelessWidget {
  const InfoModal({
    Key? key,
    this.title = "",
    required this.body,
    this.image = "",
    this.imagePadding = const EdgeInsets.all(8.0),
    this.subBody = "",
    this.buttonText = "CLOSE",
    this.callback,
  }) : super(key: key);

  final String title;
  final String body;
  final String image;
  final EdgeInsets imagePadding;
  final String subBody;
  final String buttonText;
  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.green,
      insetPadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (title != ""
                ? Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
              child: Text(
                body,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            (image != ""
                ? Flexible(
                    child: Padding(
                      padding: imagePadding,
                      child: Image(
                        image: AssetImage(image),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )
                : Container()),
            (subBody != ""
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subBody,
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container()),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BWButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (callback != null) {
                    callback!();
                  }
                },
                buttonText: buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
