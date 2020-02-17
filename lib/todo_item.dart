import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem(this.todo);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void onCheckboxChanged(bool value) {
    setState(() {
      widget.todo.checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Checkbox(
            value: widget.todo.checked,
            onChanged: onCheckboxChanged,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.todo.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              if(widget.todo.subtitle != "")
                Text(widget.todo.subtitle,
                    style: TextStyle(color: Colors.grey[500]))
            ],
          )
        ],
      ),
    );
  }
}

class Todo {
  String title = "";
  String subtitle = "";
  bool checked = false;

  Todo(this.title, this.subtitle, {this.checked = false});
}