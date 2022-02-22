import 'package:flutter/material.dart';
import 'package:json_placeholder_test/core/services/model/song_model.dart';
import 'package:json_placeholder_test/core/services/song_network.dart';

import 'page_item_view.dart';

class PageList extends StatefulWidget {
  PageList({Key? key}) : super(key: key);

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final pageController = PageController();
  List<SongModel>? _songList;
  var songNetwork = SongNetwork();
  Future<void> init() async {
    _songList = await songNetwork.fetchAllData();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemBuilder: (context, index) => PageView(
        children: [
          PageViewItem(
            title: _songList?[index].title ?? "null title",
            url: _songList?[index].url ?? "null url",
            thumbnailUrl:
                _songList?[index].thumbnailUrl ?? "null thumbnail url",
            index: index,
            lengthOfList: _songList?.length,
          )
        ],
        controller: pageController,
      ),
    ));
  }
}
