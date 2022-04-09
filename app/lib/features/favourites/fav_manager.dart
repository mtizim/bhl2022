import 'package:app/features/card_view/cardmanager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fav_manager.freezed.dart';

class FavouritesManager extends Cubit<FavouritesState> {
  FavouritesManager() : super(const FavouritesState.loading());

  void fetch() async {
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
    final d2 = CardData(
      minCapacity: 3,
      cost: 4,
      address: "Chuj chuj chujasd chuj działaj",
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
    emit(FavouritesState.ready(data: [d, d2]));
  }
}

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.loading() = FavouritesStateLoading;
  const factory FavouritesState.ready({required List<CardData> data}) =
      FavouritesStateReady;
}
