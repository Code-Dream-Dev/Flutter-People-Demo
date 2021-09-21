import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_people_demo/models/person.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final Person person;

  const ProfilePage({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person details"),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            elevation: 6,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!kIsWeb)
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: CircleAvatar(
                        radius: 48,
                        child: ClipRRect(borderRadius: BorderRadius.circular(48), child: Image.network(person.imageUrl)),
                      ),
                    ),
                  )
                else
                  SizedBox(height: 64, width: 64,),
                Flexible(
                    flex: 7,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            person.name + " " + person.last,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(person.email)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Divider(color: Colors.green,),
          Card(
            margin: const EdgeInsets.all(16),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "General information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.wc,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text("Gender"),
                  subtitle: Text(person.gender),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.cake,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text("Birthday"),
                  subtitle: Text(DateFormat("dd/MM/yy").format(person.dob)),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.map,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text("Country"),
                  subtitle: Text(person.country),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.location_city,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text("City"),
                  subtitle: Text(person.city),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Contact",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.mail,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text("E-Mail"),
                  subtitle: Text(person.email),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  title: Text("Phone"),
                  subtitle: Text(person.phone),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
