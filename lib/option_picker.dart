import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionPicker {
  final List<String> optionsList;
  final String Function(int index) getListTitle;
  final Function(int index) onPressed;
  final String title;

  OptionPicker({
    required this.optionsList,
    required this.getListTitle,
    required this.onPressed,
    this.title = "",
  });

  Future<T?> showPlatformPicker<T>(BuildContext context) {
    return Platform.isIOS == true
        ? showCupertinoModalPopup<T>(
            context: context,
            builder: (BuildContext context) {
              return getPlatformWidget(context);
            })
        : showDialog<T>(
            context: context,
            builder: (BuildContext context) {
              return getPlatformWidget(context);
            });
  }

  Widget getPlatformWidget(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActionSheet(
        title: Text(title),
        actions: optionsList
            .asMap()
            .map((index, option) => MapEntry(
                index,
                CupertinoActionSheetAction(
                  child: Text(getListTitle(index)),
                  onPressed: () => onPressed(index),
                )))
            .values
            .toList(),
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
      );
    } else {
      return SimpleDialog(
        title: Text(title),
        children: optionsList
            .asMap()
            .map((index, option) => MapEntry(
                index,
                SimpleDialogOption(
                  child: Text(getListTitle(index)),
                  onPressed: () => onPressed(index),
                )))
            .values
            .toList(),
      );
    }
  }
}
