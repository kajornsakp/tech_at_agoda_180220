import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Checkbox(
            value: checked,
            onChanged: (bool value) {
              setState(() {
                checked = value;
              });
            },
          ),
          Text("TODO")
        ],
      ),
    );
  }
}
