import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tripwise/models/app_user.dart';

final authProvider = StreamProvider.autoDispose<AppUser?>((ref) async* {
  final Stream<AppUser?> userStream =
      FirebaseAuth.instance.authStateChanges().map((user) {
    if (user != null) {
      return AppUser(uid: user.uid, email: user.email!);
    }
    return null;
  });

  //Yield the value whenever it changes
  await for (final user in userStream) {
    yield user;
  }
});
