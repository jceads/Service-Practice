import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {Key? key,
      // required this.albumId,
      // required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl,
      required this.index,
      required this.lengthOfList})
      : super(key: key);
  // final int albumId;
  // final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  final int index;
  final int? lengthOfList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              imageMethod(context),
              titleText(context),
              thumbnailUrlText(context),
            ],
          ),
          indicatorMethod(context)
        ],
      ),
    );
  }

  Padding indicatorMethod(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Text("${index + 1}/$lengthOfList"),
    );
  }

  Padding imageMethod(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: Image.network(url),
    );
  }

  Padding titleText(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ),
    );
  }

  Text thumbnailUrlText(BuildContext context) {
    return Text(thumbnailUrl,
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center);
  }
}
