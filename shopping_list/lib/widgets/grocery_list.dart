import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceyList extends StatefulWidget {
  const GroceyList({super.key});

  @override
  State<GroceyList> createState() => _GroceyListState();
}

class _GroceyListState extends State<GroceyList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadItems();
  }

  List<GroceryItem> _groceryItems = [];
  void _loadItems() async {
    final url = Uri.https('udemy-backend-6a50c-default-rtdb.firebaseio.com',
        'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(
        GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category),
      );
    }
    setState(() {
      _groceryItems = loadedItems;
    });
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) {
          return const NewItem();
        },
      ),
    );
    if (newItem == null) {
      return;
    } else {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No item try adding something from the top right corner',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: _groceryItems.isEmpty
          ? mainContent
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) {
                    // setState(() {
                    //   _groceryItems.remove(_groceryItems[index]);
                    // });
                    _removeItem(_groceryItems[index]);
                  },
                  key: ValueKey(_groceryItems[index].id),
                  child: ListTile(
                    title: Text(_groceryItems[index].name),
                    leading: Container(
                      height: 24,
                      width: 24,
                      color: _groceryItems[index].category.color,
                    ),
                    trailing: Text(_groceryItems[index].quantity.toString()),
                  ),
                );
              },
            ),
    );
  }
}
