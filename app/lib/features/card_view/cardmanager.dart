import 'dart:convert';

import 'package:app/features/filters/sidebarmanager.dart';
import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'cardmanager.freezed.dart';

class CardManager extends Cubit<CardManagerState> {
  CardManager({required this.authman})
      : super(const CardManagerState.loading());

  late Filters filters;

  final AuthorizationManager authman;

  void fetch(Filters filters) async {
    emit(const CardManagerState.loading());

    this.filters = filters;

    final token = authman.state.map(
      unknown: (_) => null,
      loggedOut: (_) => null,
      loggedIn: (s) => s.secret,
    );
    if (token == null) {
      return;
    }

    final response = await http.get(
      Uri.tryParse(C.serverAddress +
          "/cards" +
          "?offset=0&cards_amount=10&money_min=${filters.minMoney}&money_max=${filters.maxMoney}&min_capacity=${filters.persons}")!,
      headers: {"accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.statusCode == 401) {
      authman.logout();
    }

    if (response.statusCode != 200) {
      return;
    }

    final data = jsonDecode(response.body);

    final cards = (data.map<CardData>(
      (e) => CardData(
          id: e['id'],
          minCapacity: e['min_capacity'],
          cost: e['cost'],
          address: e['address'],
          tags: (e['tags'].map<String>((e) => e.toString())).toList(),
          name: e['name'],
          description: e['description'],
          imageLink: Uri.tryParse(e['image_url'])!,
          launch: Uri.tryParse(e['website_url'])!,
          timeStart:
              e['start_date'] == null ? null : DateTime.parse(e['start_date']),
          timeEnd:
              e['start_date'] == null ? null : DateTime.parse(e['end_date'])),
    )).toList();
    emit(const CardManagerState.loading());
    emit(CardManagerState.loaded(
      data: cards,
    ));
  }

  void _requestMoreData() async {
    final token = authman.state.map(
      unknown: (_) => null,
      loggedOut: (_) => null,
      loggedIn: (s) => s.secret,
    );
    if (token == null) {
      return;
    }
    final offset =
        state.map(loading: (_) => null, loaded: (s) => s.data.length);

    if (offset == null) {
      return;
    }
    final response = await http.get(
      Uri.tryParse(C.serverAddress +
          "/cards" +
          "?offset=$offset&cards_amount=10&money_min=${filters.minMoney}&money_max=${filters.maxMoney}&min_capacity=${filters.persons}")!,
      headers: {"accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.statusCode == 401) {
      authman.logout();
    }

    if (response.statusCode != 200) {
      return;
    }

    final data = jsonDecode(response.body);

    final cards = (data.map<CardData>(
      (e) => CardData(
        id: e['id'],
        minCapacity: e['min_capacity'],
        cost: e['cost'],
        address: e['address'],
        tags: (e['tags'].map<String>((e) => e.toString())).toList(),
        name: e['name'],
        description: e['description'],
        imageLink: Uri.tryParse(e['image_url'])!,
        launch: Uri.tryParse(e['website_url'])!,
        timeStart:
            e['start_date'] == null ? null : DateTime.parse(e['start_date']),
        timeEnd: e['start_date'] == null ? null : DateTime.parse(e['end_date']),
      ),
    )).toList();

    state.map(loaded: (s) => s.data.addAll(cards), loading: (_) => null);
  }

  void _onNext(int offset) {
    state.map(
      loading: (lo) => lo,
      loaded: (s) {
        if (s.data.length - offset < 5) {
          _requestMoreData();
        }
      },
    );
  }

  void interested(int offset, String id) async {
    _onNext(offset);
    final token = authman.state.map(
      unknown: (_) => null,
      loggedOut: (_) => null,
      loggedIn: (s) => s.secret,
    );
    if (token == null) {
      return;
    }

    final response = await http.post(
      Uri.tryParse(C.serverAddress + "/swipe_right" + "?event_id=$id")!,
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 401) {
      authman.logout();
    }

    if (response.statusCode != 200) {
      return;
    }
  }

  void uninterested(int offset, String id) async {
    _onNext(offset);
    final token = authman.state.map(
      unknown: (_) => null,
      loggedOut: (_) => null,
      loggedIn: (s) => s.secret,
    );
    if (token == null) {
      return;
    }

    final response = await http.post(
      Uri.tryParse(C.serverAddress + "/swipe_left" + "?event_id=$id")!,
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 401) {
      authman.logout();
    }

    if (response.statusCode != 200) {
      return;
    }
  }
}

@freezed
class CardManagerState with _$CardManagerState {
  const factory CardManagerState.loading() = CardManagerLoadingstate;
  const factory CardManagerState.loaded({
    required List<CardData> data,
  }) = CardManagerLoadedState;
}

@freezed
class CardData with _$CardData {
  factory CardData({
    required int minCapacity,
    required int cost,
    required String address,
    required List<String> tags,
    required String name,
    required String description,
    required Uri imageLink,
    required Uri launch,
    required String id,
    required DateTime? timeStart,
    required DateTime? timeEnd,
  }) = _CardData;
}
