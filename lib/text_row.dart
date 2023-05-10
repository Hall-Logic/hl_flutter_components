import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  const TextRow(
      {super.key,
      required this.text,
      this.image,
      this.value,
      this.message = ""});

  final String text;
  final String? value;
  final String? image;
  final String message;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 14, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            // width: w * .435,
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              // textAlign: TextAlign.center,
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          value == null
              ? Container()
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: w * .04, vertical: 5),
                  //rounded corners
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  // width: 100,
                  child: Text(
                    value ?? "",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: SizedBox(
              width: w * .07,
              child: image == null
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Tooltip(
                          triggerMode: TooltipTriggerMode.tap,
                          message: message,
                          child: Image(
                            image: AssetImage(image ?? ""),
                            height: 18,
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
