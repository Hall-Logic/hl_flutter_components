import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hl_flutter_components/modals/info_modal.dart';
// import 'package:hl_flutter_components/keyboard.dart';
// import 'dart:io';

class TextInputRow extends StatefulWidget {
  const TextInputRow({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.text,
    this.infoTitle = "",
    this.infoText = "",
    this.infoImage = "",
    this.imagePadding =
        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    this.infoSubText = "",
    this.explanationText = "",
    this.errorText,
    this.showInfoButton = true,
  }) : super(key: key);

  final String label;
  final Function onChanged;
  final String text;
  final String explanationText;

  final String infoTitle;
  final String infoText;
  final String infoImage;
  final EdgeInsets imagePadding;
  final String infoSubText;
  final String? errorText;

  final bool showInfoButton;

  @override
  State<TextInputRow> createState() => _TextInputRowState();
}

class _TextInputRowState extends State<TextInputRow> {
  late TextEditingController _controller;
  FocusNode numberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.text == "0" ? "" : widget.text);
  }

  void _showLoadingModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return widget.infoText != ""
            ? InfoModal(
                title: widget.infoTitle,
                body: widget.infoText,
                image: widget.infoImage,
                imagePadding: widget.imagePadding,
                subBody: widget.infoSubText,
              )
            : Container();
      },
    );
  }

  @override
  void dispose() {
    // Clean up the focus node
    _controller.dispose();
    numberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: _controller,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      widget.onChanged("0");
                    } else {
                      int intValue = int.tryParse(value) ?? 0;
                      if (intValue < 0 || intValue > 99999) {
                        _controller.value = TextEditingValue(
                            text: value.substring(0, value.length - 1),
                            selection: TextSelection.fromPosition(
                                TextPosition(offset: value.length - 1)));
                      } else {
                        widget.onChanged(value);
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
                  focusNode: numberFocusNode,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder().copyWith(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    labelText: widget.label,
                    errorText: widget.errorText,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              // (widget.showInfoButton
              //     ? Padding(
              //         padding: const EdgeInsets.only(left: 10.0),
              //         child: IconButton(
              //           icon: const Icon(Icons.info_outline),
              //           iconSize: 28,
              //           onPressed: () {
              //             _showLoadingModal();
              //           },
              //         ),
              //       )
              //     : Container()),
            ],
          ),
          if (widget.showInfoButton)
            Row(
              children: [
                SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {
                    _showLoadingModal();
                  },
                  child: Text(
                    "WHAT IS ${widget.label}?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
