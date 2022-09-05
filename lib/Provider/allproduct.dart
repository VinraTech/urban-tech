import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Services/allproduct.dart';
import '../model/allproductmodel.dart';

final userDataProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  return ref.read(apisssProvider).getUser();
});
