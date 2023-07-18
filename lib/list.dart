import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late List<ValueNotifier<int>> listItem;

  @override
  void initState() {
    super.initState();
    // Initialize the list with 100 ValueNotifier<int> instances, each initialized with a value of 0.
    listItem = List.generate(100, (index) => ValueNotifier<int>(0));
  }

  @override
  void dispose() {
    // When dispose should dispose all the items from ValueNotifier.
    for (var item in listItem) {
      item.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) => ListItemWidget(
          item: listItem[index],
          onIncrease: () => listItem[index].value++,
        ),
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  final ValueNotifier<int> item;
  final VoidCallback onIncrease;

  const ListItemWidget({
    Key? key,
    required this.item,
    required this.onIncrease,
  }) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          // Display the value of the ValueNotifier<int> using a ValueListenableBuilder.
          ValueListenableBuilder<int>(
            valueListenable: widget.item,
            builder: (context, value, _) => Text(value.toString()),
          ),
          MaterialButton(
            onPressed: widget.onIncrease,
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}
