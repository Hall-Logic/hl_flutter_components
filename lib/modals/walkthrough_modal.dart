import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughModal extends StatefulWidget {
  @override
  _WalkthroughModalState createState() => _WalkthroughModalState();
}

class _WalkthroughModalState extends State<WalkthroughModal> {
  int _currentPage = 0;
  final _pageController = PageController();

  List<Widget> _pages = [
    WalkthroughPage(
      title: "CALIBRATION PROCESS",
      body:
          "Using your phone sensors, we'll use a known weight as a baseline for calculating tongue weight",
      image: "assets/phone_angle.png",
      subBody: "",
    ),
    WalkthroughPage(
      body: "Turn phone alert volume all the way up",
      subBody:
          "You will need to leave your phone in the cab. The process is complete when the beeping stops",
      imageWidget: Icon(
        Icons.volume_up,
        size: 140,
        color: Colors.grey.shade800,
      ),
    ),
    WalkthroughPage(
      body: "You will place your phone on the drivers floor mat",
      subBody: "",
      image: "assets/phone_floor_mat.png",
    ),
    WalkthroughPage(
      body: "The phone will get a baseline reading",
      subBody: "",
      image: "assets/initializing_modal.png",
    ),
    WalkthroughPage(
        body: "The calibration procedure will begin automatically",
        subBody:
            "When the 15 second countdown begins, move to the tailgate, add your body weight, and hold still until beeping stops",
        imageWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Image(image: AssetImage("assets/calibration_screen.png")))),
    WalkthroughPage(
      body:
          "Once calibration data is collected, we will repeat the process to verify calibration",
      subBody:
          "After calibration is verified, you will be able to estimate your tongue weight",
      imageWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Image(
          image: AssetImage("assets/large_check.png"),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 3 / 5,
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: _pages,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 115,
                        child: TextButton(
                          style: ButtonStyle(alignment: Alignment.centerLeft),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: _currentPage == 0
                              ? Row(
                                  children: [
                                    SizedBox(width: 14),
                                    // Text(
                                    //   "SKIP",
                                    //   style: TextStyle(
                                    //       color:
                                    //           Theme.of(context).primaryColor),
                                    // ),
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: ExpandingDotsEffect(
                          expansionFactor: 2,
                          dotHeight: 9.0,
                          dotWidth: 9.0,
                          activeDotColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 115,
                        child: _currentPage < _pages.length - 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    alignment: Alignment.centerRight,
                                    icon: Icon(Icons.arrow_forward,
                                        color: Theme.of(context).primaryColor),
                                    onPressed: () {
                                      setState(() {
                                        _currentPage += 1;
                                        _pageController.animateToPage(
                                            _currentPage,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10),
                                ],
                              )
                            : TextButton(
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("GET STARTED",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor)),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WalkthroughPage extends StatelessWidget {
  final String? title;
  final String body;
  final String? image;
  final Widget? imageWidget;
  final String subBody;

  WalkthroughPage({
    this.title,
    required this.body,
    this.image,
    this.imageWidget,
    required this.subBody,
  }) : assert(image != null || imageWidget != null,
            'Either image or imageWidget must be provided.');

  final TextStyle ts = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(title!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          Flexible(
            flex: 2,
            child: Text(body, style: ts, textAlign: TextAlign.center),
          ),
          Flexible(
            flex: 5,
            child: Align(
              alignment: Alignment.center,
              child: image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Image(image: AssetImage(image!)))
                  : imageWidget!,
            ),
          ),
          (subBody.isNotEmpty)
              ? Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        Text(subBody, style: ts, textAlign: TextAlign.center),
                  ),
                )
              : SizedBox(height: 20),
        ],
      ),
    );
  }
}
