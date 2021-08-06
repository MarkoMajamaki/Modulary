import 'package:app/services/servicelocator.dart';
import 'package:app/viewmodels/modular_list_viewmodel.dart';
import 'package:flutter/material.dart';

///
/// Multi module list view example
///
class ModularListView extends StatefulWidget {
  static String route = "ModularListView";
  ModularListView({Key? key}) : super(key: key);

  @override
  _ModularListViewState createState() => _ModularListViewState();
}

class _ModularListViewState extends State<ModularListView> {
  ModularListViewModel _viewmodel = serviceLocator<ModularListViewModel>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Modular ListView"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "sync"),
              Tab(text: "async"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _syncList(),
            _asyncList(),
          ],
        ),
      ),
    );
  }

  Widget _syncList() {
    return ListView.builder(
      itemCount: _viewmodel.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            _viewmodel.items[index],
          ),
        );
      },
    );
  }

  Widget _asyncList() {
    return FutureBuilder<List<String>>(
      future: _viewmodel.itemsAsync,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  snapshot.data![index],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
