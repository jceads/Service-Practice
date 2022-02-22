import 'package:flutter/material.dart';
import 'package:json_placeholder_test/core/constants/string_const.dart';
import 'package:json_placeholder_test/core/services/model/song_model.dart';
import 'package:json_placeholder_test/core/services/song_network.dart';

class ListItemView extends StatefulWidget {
  const ListItemView({Key? key}) : super(key: key);

  @override
  State<ListItemView> createState() => _ListItemViewState();
}

class _ListItemViewState extends State<ListItemView> {
  SongNetwork songNetwork = SongNetwork();
  List<SongModel>? _songModel;

  Future<void> init() async {
    _songModel = await songNetwork.fetchAllData();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => ItemCard(index),
        itemCount: _songModel?.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: init,
        child: const Icon(Icons.add),
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

  Card ItemCard(int index) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ItemListTile(index),
    );
  }

  ListTile ItemListTile(int index) {
    return ListTile(
      title: Text(_songModel?[index].title ?? ""),
      // title: Text(_songModel?[index].title ?? CircularProgressIndicator),
      subtitle: Text(_songModel?[index].thumbnailUrl ?? "Null"),
      leading:
          CircleAvatar(child: Image.network(_songModel?[index].url ?? 'Null')),
      trailing: IconButton(
        onPressed: () => setState(() {
          _songModel?.removeAt(index);
        }),
        icon: const Icon(Icons.delete),
        color: Colors.red,
      ),
    );
  }
}
