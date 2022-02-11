import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_people_demo/home/person_item.dart';
import 'package:flutter_people_demo/home_new/bloc/home_page_bloc.dart';

class HomePageNew extends StatefulWidget {
  @override
  _HomePageNewState createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("People demo")),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageLoading)
            return Center(child: CircularProgressIndicator());
          else if (state is HomePageLoaded)
            return ListView(
                children: state.people
                    .map(
                      (person) => PersonItem(
                        person: person,
                      ),
                    )
                    .toList());
          else
            return Center(
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                child: Text("Load people", style: TextStyle(color: Colors.white),),
                onPressed: () => context.read<HomePageBloc>().add(HomePageInit()),
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("!"),
        child: Icon(Icons.add),
      ),
    );
  }
}
