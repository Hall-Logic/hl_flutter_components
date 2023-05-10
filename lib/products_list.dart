import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key, required this.products}) : super(key: key);
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 134;
    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Padding(
            padding: EdgeInsets.only(
                left: 10,
                bottom: 12,
                top: 12,
                right: (index == products.length - 1 ? 10 : 0)),
            child: _Product(
              item: item,
              index: index,
              itemHeight: itemHeight,
            ),
          );
        },
      ),
    );
  }
}

class _Product extends StatelessWidget {
  const _Product({
    Key? key,
    required this.item,
    required this.index,
    // required this.itemWidth,
    required this.itemHeight,
  }) : super(key: key);

  final Map<String, dynamic> item;
  final int index;
  // final double itemWidth;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = item['link'];
        Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          // await launchUrl(uri, mode: isAndroid ? LaunchMode.externalApplication);
          Platform.isAndroid
              ? await launchUrl(uri, mode: LaunchMode.externalApplication)
              : await launchUrl(uri);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Card(
        elevation: 0,
        child: SizedBox(
          width: itemHeight * 2.4,
          height: itemHeight,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      //description

                      Text(
                        'Tap here for price',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
