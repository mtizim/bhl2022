import 'package:app/features/filters/sidebarmanager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cardmanager.freezed.dart';

class CardManager extends Cubit<CardManagerState> {
  CardManager() : super(const CardManagerState.loading());

  late Filters filters;

  void fetch(Filters filters) async {
    emit(const CardManagerState.loading());
    this.filters = filters;
    // TODO get data from server with filters
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final d = CardData(
      minCapacity: 3,
      cost: 4,
      address: "Schodki warszawa powiat warszawski woj warszawskie",
      tags: [
        "Schodki",
        "Wódka",
        "Chlańksko",
        "Dużo tagów",
        "Więcej",
        "Family friendly"
      ],
      name: "Long ass event name at down town schodki warszawa",
      description: "Lorem ipsum dolor sit amet sup dorempiditur anifemo volum ",
      imageLink: Uri.tryParse("https://picsum.photos/280")!,
      launch: Uri.tryParse("https://picsum.photos/280")!,
    );
    emit(CardManagerState.loaded(
      data: [
        d,
        d,
        d,
        d,
        d,
        d,
        d,
        d,
      ],
    ));
  }

  void _requestMoreData() async {
    // TODo get data from server with filters
    final d = CardData(
      minCapacity: 3,
      cost: 4,
      address: "Chuj chuj chuj chuj działaj",
      tags: [
        "Schodki",
        "Wódka",
        "Chlańksko",
        "Dużo tagów",
        "Więcej",
        "Family friendly"
      ],
      name: "Long ass event name at down town schodki warszawa",
      description: "Lorem ipsum dolor sit amet sup dorempiditur anifemo volum ",
      imageLink: Uri.tryParse("https://picsum.photos/280")!,
      launch: Uri.tryParse("https://picsum.photos/280")!,
    );
    await Future<void>.delayed(const Duration(milliseconds: 10));
    state.map(loaded: (s) => s.data.add(d), loading: (_) => null);
    print("reached end of data");
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

  void interested(int offset) {
    _onNext(offset);
  }

  void uninterested(int offset) {
    _onNext(offset);
  }
}

@freezed
class CardManagerState with _$CardManagerState {
  const factory CardManagerState.loading() = CardManagerLoadingstate;
  const factory CardManagerState.loaded({
    required List<CardData> data,
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
    required Uri launch,
  }) = _CardData;
}
