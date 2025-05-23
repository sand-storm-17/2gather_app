import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gather/features/authentication/models/app_user.dart';
import 'package:gather/features/authentication/repository/auth_repository.dart';

// class FakeAuthRepository implements AuthRepository {
//   @override
//   Stream<AppUser?> authStateChanges() {
//     // TODO: implement authStateChanges
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<AppUser?> signInAnonymously() {
//     // TODO: implement signInAnonymously
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> signOut() {
//     // TODO: implement signOut
//     throw UnimplementedError();
//   }
//
// }
// //
//
// final authRepositoryProvider = Provider<AuthRepository>((ref){
//   return FakeAuthRepository();
// });