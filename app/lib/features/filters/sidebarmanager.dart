import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sidebarmanager.freezed.dart';

class SidebarManager extends Cubit<Filters> {
  SidebarManager() : super(Filters(minMoney: 1, maxMoney: 4, persons: 1));

  void chooseMinMoney(int money) {
    emit(state.copyWith(minMoney: money));
  }

  void chooseMaxMoney(int money) {
    emit(state.copyWith(maxMoney: money));
  }

  void chooseGroupSize(int people) {
    emit(state.copyWith(persons: people));
  }
}

class FC {
  static List<int> moneyValues = [1, 2, 3, 4];
  static List<int> personValues = [1, 2, 4, 7];

  static Map<int, String> moneyDescriptions = {
    1: "Cheapest",
    2: "Cheaper",
    3: "Pricier",
    4: "Expensive",
  };
  static Map<int, String> personDescriptions = {
    1: "Single",
    2: "Pair",
    4: "Smaller group",
    7: "Bigger group",
  };
}

@freezed
class Filters with _$Filters {
  factory Filters({
    // 1,2,3,4
    required int minMoney,
    // 1,2,3,4
    required int maxMoney,
    // 1,2,4,7
    required int persons,
  }) = _Filters;
}
