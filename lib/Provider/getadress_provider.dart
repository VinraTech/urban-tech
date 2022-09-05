import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i/Services/adress_Service.dart';
import 'package:i/model/adressmodel.dart';

final userssDataProvider =
    FutureProvider.autoDispose<List<Address>>((ref) async {
  return ref.read(apissProvider).getAdress();
});
