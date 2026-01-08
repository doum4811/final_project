import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../repos/authentication_repository.dart';

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, void>(() {
  return AuthViewModel();
});

class AuthViewModel extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // 초기 작업 없음
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signIn(email, password);
    });
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).signUp(email, password);
    });
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}
