import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cardmanager.freezed.dart';

class CardManager extends Cubit<CardManagerState> {
  CardManager() : super(const CardManagerState.loading());

  void fetch() async {
    // TODO get data from server
    await Future<void>.delayed(Duration(milliseconds: 300));
  }

  void _requestMoreData() async {
    // TODo get data from server
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  void _onNext() {
    final newState = state.map(
      loading: (lo) => lo,
      loaded: (s) {
        if (s.data.length - s.offset < 4) {
          _requestMoreData();
        }
        return s;
      },
    );

    emit(newState);
  }

  void interested() {
    _onNext();
  }

  void uninterested() {
    _onNext();
  }
}

@freezed
class CardManagerState with _$CardManagerState {
  const factory CardManagerState.loading() = CardManagerLoadingstate;
  const factory CardManagerState.loaded({
    required List<CardData> data,
    required int offset,
  }) = CardManagerLoadedState;
}

CardData? parseData(dynamic data) {
  print(data);
  return null;
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
  }) = _CardData;
}
