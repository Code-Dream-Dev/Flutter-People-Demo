import 'package:flutter/material.dart';
import 'package:flutter_people_demo/models/person.dart';
import 'package:flutter_people_demo/profile/profile_page.dart';

class PersonItem extends StatelessWidget {
  final Person person;

  const PersonItem({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfilePage(person: person))),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(person.name + " " + person.last),
        subtitle: Text(person.country),
      ),
    );
  }
}
