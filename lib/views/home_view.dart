import 'package:flutter/material.dart';
import 'package:json_placeholder_test/core/constants/string_const.dart';
import 'package:json_placeholder_test/core/services/model/song_model.dart';
import 'package:json_placeholder_test/core/services/song_network.dart';
import 'package:json_placeholder_test/views/list_item_view.dart';
import 'package:json_placeholder_test/views/page_list.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SongNetwork songNetwork = SongNetwork();
  bool _isVievPage = false;

  void _changeViews() {
    setState(() {
      _isVievPage = !_isVievPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: _isVievPage ? PageList() : const ListItemView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeViews,
        child: const Icon(Icons.view_carousel_sharp),
      ),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      title: const Text(StringConstant.titleOfApp),
      elevation: 0,
      centerTitle: true,
    );
  }
}
