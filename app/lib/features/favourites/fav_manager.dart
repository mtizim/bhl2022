import 'dart:convert';

import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'fav_manager.freezed.dart';

class FavouritesManager extends Cubit<FavouritesState> {
  FavouritesManager({required this.loginState})
      : super(const FavouritesState.loading());

  final LoginState loginState;
  void fetch() async {
    final token = loginState.map(
      unknown: (_) => null,
      loggedOut: (_) => null,
      loggedIn: (s) => s.secret,
    );
    if (token == null) {
      return;
    }

    final response = await http.get(
      Uri.tryParse(C.serverAddress + "/favorites")!,
      headers: {"accept": "application/json", "Authorization": "Bearer $token"},
    );

    if (response.statusCode != 200) {
      return;
    }

    final data = jsonDecode(response.body);

    final cards = (data.map<CardData>(
      (e) => CardData(
        id: "e['id']",
        minCapacity: e['min_capacity'],
        cost: e['cost'],
        address: e['address'],
        tags: (e['tags'].map<String>((e) => e.toString())).toList(),
        name: e['name'],
        description: e['description'],
        imageLink: Uri.tryParse(e['image_url'])!,
        launch: Uri.tryParse(e['website_url'])!,
      ),
    )).toList();

    emit(FavouritesState.ready(data: cards));
  }
}

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.loading() = FavouritesStateLoading;
  const factory FavouritesState.ready({required List<CardData> data}) =
      FavouritesStateReady;
}
