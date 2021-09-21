import 'package:flutter/material.dart';
import 'package:flutter_people_demo/home/person_item.dart';
import 'package:flutter_people_demo/models/person.dart';
import 'package:flutter_people_demo/rest_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;
  List<Person> _people;


  void _initPeople() async {
    // Update the UI
    setState(() {
      _loading = true;
    });

    // Fetch data from the internet
    List<Person> data = await RestClient().getPeople(25);

    // Update the UI
    setState(() {
      _people = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("People demo")),
      body: _people != null
          ? ListView(
              children: _people
                  .map((person) => PersonItem(
                        person: person,
                      ))
                  .toList(),
            )
          : Center(
              child: _loading
                  ? CircularProgressIndicator()
                  : OutlineButton(
                      child: Text("Load people"),
                      onPressed: _initPeople,
                    )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("!"),
        child: Icon(Icons.add),
      ),
    );
  }
}
