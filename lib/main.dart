import 'package:flutter/material.dart';

import 'todo_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Tasks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Todo> todos = [
    Todo("Hello", "World"),
    Todo("Hello", "World"),
    Todo("Hello", "World"),
    Todo("Hello", "World"),
    Todo("Hello", "World"),
  ];

  void showCompletedTasks() {
    var complete = todos.where((item) => item.checked).toList();
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    "Completed",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  centerTitle: false,
                  elevation: 0.0,
                  automaticallyImplyLeading: true,
                ),
                body: ListView.separated(
                    itemCount: complete.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(height: 1.0);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return new TodoItem(complete[index]);
                    }),
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: ListView.separated(
            itemCount: todos.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 1.0);
            },
            itemBuilder: (BuildContext context, int index) {
              return new TodoItem(todos[index]);
            }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Spacer(),
            IconButton(icon: Icon(Icons.done), onPressed: showCompletedTasks,)
          ],
        ),
      ),
    );
  }
}
