import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<String> _toDoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  void _addItem(String item) {
    setState(() {
      _toDoList.add(item);
    });
    _textFieldController.clear();
  }

  void _editItem(int index, String newItem) {
    setState(() {
      _toDoList[index] = newItem;
    });
    _textFieldController.clear();
  }

  void _deleteItem(int index) {
    setState(() {
      _toDoList.removeAt(index);
    });
  }

  Future<dynamic> _displayAddDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            contentPadding: EdgeInsets.only(
                left: 20.0, top: 20.0, right: 20.0, bottom: 8.0),
            actionsPadding: EdgeInsets.only(right: 20.0, bottom: 8.0),
            title: Text(
              'Add To-Do',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.teal,
              ),
            ),
            content: TextField(
              controller: _textFieldController,
              style: TextStyle(
                color: Colors.teal,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: 'New To-Do',
                hintText: 'Enter To-Do here',
                labelStyle: TextStyle(
                  color: Colors.teal[200],
                ),
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _addItem(_textFieldController.text);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(32, 32),
                  backgroundColor: Colors.teal,
                  elevation: 6.0,
                ),
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _textFieldController.clear();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(32, 32),
                  backgroundColor: Colors.orange,
                  elevation: 6.0,
                ),
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  Future<dynamic> _displayEditDialog(BuildContext context, int index) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            contentPadding: EdgeInsets.only(
                left: 20.0, top: 20.0, right: 20.0, bottom: 8.0),
            actionsPadding: EdgeInsets.only(right: 20.0, bottom: 8.0),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.teal,
                ),
                children: [
                  TextSpan(text: 'Edit '),
                  TextSpan(
                      text: _toDoList[index],
                      style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),
            content: TextField(
              controller: _textFieldController,
              style: TextStyle(
                color: Colors.teal,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: 'Updated To-Do',
                hintText: 'Enter To-Do here',
                labelStyle: TextStyle(
                  color: Colors.teal[200],
                ),
                hintStyle: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _editItem(index, _textFieldController.text);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(32, 32),
                  backgroundColor: Colors.teal,
                  elevation: 6.0,
                ),
                child: Text('Edit'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _textFieldController.clear();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(32, 32),
                  backgroundColor: Colors.orange,
                  elevation: 6.0,
                ),
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  Future<dynamic> _displayDeleteDialog(BuildContext context, int index) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            actionsPadding: EdgeInsets.only(top: 8.0, right: 20.0, bottom: 8.0),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.teal,
                ),
                children: [
                  TextSpan(text: 'Delete '),
                  TextSpan(
                      text: _toDoList[index],
                      style: TextStyle(color: Colors.orange)),
                  TextSpan(text: ' from To-Do-List?'),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _deleteItem(index);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(32, 32),
                  backgroundColor: Colors.teal,
                  elevation: 6.0,
                ),
                child: Text('Delete'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _textFieldController.clear();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(32, 32),
                  backgroundColor: Colors.orange,
                  elevation: 6.0,
                ),
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  Widget _buildToDoItem(int index, String item) {
    return Card(
      margin: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
      color: Colors.deepOrange[50],
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                _displayEditDialog(context, index);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(32, 32),
                backgroundColor: Colors.teal,
                elevation: 6.0,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                _displayDeleteDialog(context, index);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(32, 32),
                backgroundColor: Colors.orange,
                elevation: 6.0,
              ),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    final List<Widget> toDoItems = <Widget>[];
    toDoItems.add(SizedBox(
      height: 8.0,
    ));
    _toDoList.asMap().forEach((index, item) {
      toDoItems.add(_buildToDoItem(index, item));
    });
    toDoItems.add(SizedBox(
      height: 8.0,
    ));
    return toDoItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, top: 12.0, right: 20.0, bottom: 12.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topLeft,
                      image: AssetImage('assets/images/header-bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                            color: Colors.white,
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                          children: const [
                            TextSpan(text: 'To-Do-'),
                            TextSpan(
                                text: 'List',
                                style: TextStyle(color: Colors.orange)),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _displayAddDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 32),
                          backgroundColor: Colors.white,
                          elevation: 12.0,
                        ),
                        icon: Icon(
                          Icons.add,
                          color: Colors.teal,
                        ),
                        label: Text(
                          'Add',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: _getItems(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
