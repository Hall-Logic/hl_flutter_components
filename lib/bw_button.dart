//import material design
import 'package:flutter/material.dart';

class BWButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final bool loading;

  const BWButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.fromHeight(45),
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(),
            )
          : Text(
              buttonText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
    );
  }
}

class BWButtonSecondary extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final bool loading;

  const BWButtonSecondary({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const CircularProgressIndicator();
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size.fromHeight(45),
      ),
      onPressed: onPressed,
      child: Text(buttonText,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
    );
  }
}

class BWBottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final bool loading;

  const BWBottomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: !loading
          ? BWButton(
              onPressed: () => onPressed(),
              buttonText: buttonText,
              loading: loading,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
    );
  }
}
