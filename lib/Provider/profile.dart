import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i/Services/profileservices.dart';

import 'package:i/model/profilemodel.dart';

final profileDataProvider = FutureProvider.autoDispose<Profile>((ref) async {
  return ref.read(ProfileProvider).getprofile();
});
