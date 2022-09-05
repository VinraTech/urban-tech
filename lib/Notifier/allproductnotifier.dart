import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Services/allproduct.dart';
import '../model/allproductmodel.dart';

class ListProductNotifier extends StateNotifier<List<Product>> {
  ListProductNotifier(this.services) : super([]) {
    init();
  }
  final ApiServices services;
  Future<void> init() async {
    state = await services.getUser();
  }

  void addtocart(int index) {
    state = [
      ...state.take(index),
      state[index].copywith(
          count: state[index].count! + 1,
          totalitemprice:
              double.parse(state[index].price) * (state[index].count! + 1)),
      ...state.skip(index + 1)
    ];
  }

  void removetocart(int index) {
    state = [
      ...state.take(index),
      state[index].copywith(
          count: state[index].count! > 0 ? state[index].count! - 1 : 0,
          totalitemprice:
              double.parse(state[index].price) * (state[index].count!)),
      ...state.skip(index + 1)
    ];
  }
}

final listnotiProvider =
    StateNotifierProvider<ListProductNotifier, List<Product>>((ref) {
  return ListProductNotifier(ref.read(apisssProvider));
});
