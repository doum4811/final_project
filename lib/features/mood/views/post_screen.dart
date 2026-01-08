import 'package:final_project/features/mood/view_models/post_view_model.dart';
import 'package:final_project/features/mood/widgets/mood_header.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends ConsumerState<PostScreen> {
  static const _bg = Color(0xFFE9E1BE);
  static const _pink = Color(0xFFFFA6E8);

  final _controller = TextEditingController();
  String _emoji = "😀";

  final _emojis = const ["😀", "😍", "😊", "🥳", "😭", "🤬", "🫠", "🤮"];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _post() {
  //   // TODO: Firestore createMood 연결
  //   debugPrint("POST: $_emoji / ${_controller.text}");
  //   _controller.clear();
  // }
  Future<void> _post() async {
    final desc = _controller.text.trim();
    if (desc.isEmpty) return;

    await ref
        .read(postViewModelProvider.notifier)
        .post(emoji: _emoji, description: desc);

    final state = ref.read(postViewModelProvider);
    if (!mounted) return;

    state.when(
      data: (_) {
        _controller.clear();
        // Post 후 Home으로 이동
        context.go("/"); // 또는 MainNav 방식에 맞춰 "/home" 등
      },
      loading: () {},
      error: (e, _) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            const MoodHeader(), // right 없음

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "How do you feel?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black, width: 2.2),
            //       // borderRadius: BorderRadius.circular(12),,
            //       boxShadow: const [kShadow],
            //       borderRadius: BorderRadius.circular(kBoxRadius),
            //     ),
            //     child: TextField(
            //       controller: _controller,
            //       maxLines: 6,
            //       decoration: const InputDecoration(
            //         hintText: "Write it down here!",
            //         border: InputBorder.none,
            //         contentPadding: EdgeInsets.all(14),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 170, // 두 번째 스샷 느낌: 낮고 납작
                decoration: BoxDecoration(
                  color: kBgColor, // 중요: 박스 배경색 채우기
                  border: Border.all(color: kBorderColor, width: 2.2),
                  borderRadius: BorderRadius.circular(kBoxRadius),
                  // 두 번째 스샷은 그림자 거의 없음 → 제거
                  boxShadow: const [kShadow],
                  // boxShadow: const [kSoftShadow],
                ),
                padding: const EdgeInsets.all(14),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true, // 박스 높이만큼 채우기
                  decoration: const InputDecoration(
                    hintText: "Write it down here!",
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What’s your mood?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                children: _emojis.map((e) {
                  final selected = e == _emoji;
                  return InkWell(
                    onTap: () => setState(() => _emoji = e),
                    child: Container(
                      width: 38,
                      height: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // color: Colors
                        //     .white, //
                        color: selected ? Colors.white : Colors.grey,
                        boxShadow: const [kShadow],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Text(e, style: const TextStyle(fontSize: 18)),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: _post,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),

                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),
            Container(height: 1.2, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
