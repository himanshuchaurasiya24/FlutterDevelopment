import 'package:expense_app/models/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryFetcher extends StatefulWidget {
  const CategoryFetcher({super.key});

  @override
  State<CategoryFetcher> createState() => _CategoryFetcherState();
}

class _CategoryFetcherState extends State<CategoryFetcher> {
  late Future _categoryList;
  Future _getCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return provider.fetchCategories();
  }

  @override
  void initState() {
    // TODO: implement initState
    _categoryList = _getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _categoryList,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.hasError.toString(),
                ),
              );
            } else {
              return Consumer<DatabaseProvider>(
                builder: (_, db, __) {
                  var list = db.categories;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, i) => ListTile(
                      title: Text(list[i].title),
                      subtitle: Text('entries: ${list[i].entries}'),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
