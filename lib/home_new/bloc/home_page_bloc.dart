import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_people_demo/models/person.dart';
import 'package:flutter_people_demo/rest_client.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({@required this.client}) : super(HomePageInitial()) {
    on<HomePageInit>((event, emit) async {
      emit(HomePageLoading());

      final people = await client.getPeople(25);

      emit(HomePageLoaded(people: people));
    });
  }

  final RestClient client;
}
