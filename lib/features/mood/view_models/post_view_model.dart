import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:final_project/features/authentication/view_models/auth_view_model.dart';
import 'package:final_project/features/mood/repos/mood_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, AsyncValue<void>>(
      (ref) => PostViewModel(ref),
    );

class PostViewModel extends StateNotifier<AsyncValue<void>> {
  PostViewModel(this.ref) : super(const AsyncData(null));
  final Ref ref;

  Future<void> post({
    required String emoji,
    required String description,
  }) async {
    final auth = ref.read(authStateProvider);
    final user = auth.asData?.value;

    if (user == null) {
      state = AsyncError("로그인이 필요합니다.", StackTrace.current);
      return;
    }

    state = const AsyncLoading();
    try {
      await ref
          .read(moodRepoProvider)
          .createMood(uid: user.uid, emoji: emoji, description: description);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
