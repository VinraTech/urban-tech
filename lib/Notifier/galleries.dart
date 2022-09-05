import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i/model/Modelgalleries.dart';

import '../Services/allgalaries.dart';

class Galleries extends StateNotifier<List<Gallory>> {
  Galleries(this.services) : super([]) {
    init();
  }
  final ApisService services;
  Future<void> init() async {
    state = await services.getgalllery();
  }

//   void addtocart(int index) {
//     state = [
//       ...state.take(index),
//       state[index].copywith(
//           count: state[index].count! + 1,
//           totalitemprice:
//               double.parse(state[index].price) * (state[index].count! + 1)),
//       ...state.skip(index + 1)
//     ];
//   }

//   void removetocart(int index) {
//     state = [
//       ...state.take(index),
//       state[index].copywith(
//           count: state[index].count! > 0 ? state[index].count! - 1 : 0,
//           totalitemprice:
//               double.parse(state[index].price) * (state[index].count!)),
//       ...state.skip(index + 1)
//     ];
//   }
}

final GalleiresnotiProvider =
    StateNotifierProvider<Galleries, List<Gallory>>((ref) {
  return Galleries(ref.read(apissProvider));
});
