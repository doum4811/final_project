import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:final_project/features/mood/models/mood_entry.dart';
import 'package:final_project/features/mood/repos/mood_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final moodListProvider = StreamProvider<List<MoodEntry>>((ref) {
//   final auth = ref.watch(authStateProvider);

//   final user = auth.asData?.value;
//   if (user == null) {
//     return const Stream.empty();
//   }

//   return ref.watch(moodRepoProvider).watchMoods(user.uid);
// });
final moodListProvider = StreamProvider<List<MoodEntry>>((ref) {
  final auth = ref.watch(authStateProvider);
  final uid = auth.asData?.value?.uid;

  if (uid == null) return const Stream<List<MoodEntry>>.empty();
  return ref.read(moodRepoProvider).watchMoods(uid);
});

final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

class HomeViewModel {
  HomeViewModel(this.ref);
  final Ref ref;

  Future<void> delete(String id) async {
    await ref.read(moodRepoProvider).deleteMood(id);
  }
}
