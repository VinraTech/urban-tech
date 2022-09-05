import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/allgalaries.dart';
import '../model/Modelgalleries.dart';


final userssDataProvider =
    FutureProvider.autoDispose<List<Gallory>>((ref) async {
  return ref.read(apissProvider).getgalllery();
});
