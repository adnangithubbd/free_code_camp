import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutoDemo extends StatefulWidget {
  const AutoDemo({Key? key}) : super(key: key);

  @override
  State<AutoDemo> createState() => _AutoDemoState();
}

class _AutoDemoState extends State<AutoDemo> {
  final String apiUrl = 'https://fakestoreapi.com/products/';
  final TextEditingController _textEditingController = TextEditingController();
  List<String> suggestions = [];
  bool showSuggestions = true;

  Future<List<String>> getSuggestions(String pattern) async {
    var responce = await http.get(Uri.parse(apiUrl));
    if (responce.statusCode == 200) {
      List<dynamic> data = json.decode(responce.body);
      List<String> titles = data
          .where((item) => item['title']
              .toString()
              .toLowerCase()
              .contains(pattern.toLowerCase().trim()))
          .map((item) => item['title'].toString())
          .toList();
      return titles;
    } else {
      throw Exception('Failed to load suggestions.. ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestion demo '),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: 'Search',
              hintText: 'Type here..',
            ),
            onChanged: (value) async {
              List<String> filteredSuggestion = await getSuggestions(value);
              setState(() {
                if (_textEditingController.text.isEmpty) {
                  showSuggestions = false;
                } else {
                  suggestions = filteredSuggestion;
                  showSuggestions = true;
                }
              });
            },
          ),
          Expanded(
            child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _textEditingController.text = suggestions[index];
                        showSuggestions = false;
                      });
                    },
                    child: showSuggestions
                        ? ListTile(
                            title: Text(suggestions[index]),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
