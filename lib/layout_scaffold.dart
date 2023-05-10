import 'package:flutter/material.dart';

class LayoutScaffold extends StatelessWidget {
  final Widget body;
  final Function? handleOnWillPop;
  final Widget? sideContent;
  final AppBar? appBar;
  //scaffold optional parameters
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawerDragStartBehavior;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  //resizeToAvoidBottomInset
  final bool? resizeToAvoidBottomInset;

  const LayoutScaffold({
    Key? key,
    required this.body,
    this.handleOnWillPop,
    this.sideContent,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawerDragStartBehavior,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return handleOnWillPop?.call() ?? true;
      },
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Use tablet layout
          return Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
            // appBar: appBar logoAppBar(context),
            appBar: appBar,
            body: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Container(
                      // padding: ...
                      child: sideContent ?? Container(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(child: body),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Container(
                      // padding: ...
                      child: sideContent ?? Container(),
                    ),
                  ),
                ),
              ],
            ),
            drawer: drawer,
            endDrawer: endDrawer,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            persistentFooterButtons: persistentFooterButtons,
          );
        } else {
          // Use phone layout
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: appBar,
            body: SafeArea(child: body),
            drawer: drawer,
            endDrawer: endDrawer,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            persistentFooterButtons: persistentFooterButtons,
          );
        }
      }),
    );
  }
}
