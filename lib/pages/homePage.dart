import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<String> itemList = [
    'apple',
    'banana',
    'avocado',
    'orange',
    'melon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          "Searcher",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return itemList.where((String item) {
                    return item.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String item) {
                  print("The $item was selected");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
