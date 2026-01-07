import 'package:final_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Home")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go('/search'),
//           child: const Text("Go Search"),
//         ),
//       ),
//     );
//   }
// }
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _bg = Color(0xFFE9E1BE);
  static const _card = Color(0xFF6FBFAF);

  @override
  Widget build(BuildContext context) {
    // TODO: 나중에 Firestore Stream으로 바꾸면 됨
    final dummy = const [
      (
        "😍",
        "Today I feel amazing! I really like Flutter, I love building beautiful things!",
        "30 minutes ago",
      ),
      ("😭", "서울에 비가 많이 와요 ㅠㅠ", "1 day ago"),
      ("🥳", "It was my birthday today! I feel great!", "2 days ago"),
    ];

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 18),
          const Text(
            "🔥 MOOD 🔥",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 18),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: dummy.length,
              separatorBuilder: (_, __) => const SizedBox(height: 18),
              itemBuilder: (context, index) {
                final (emoji, text, time) = dummy[index];

                return _MoodCard(
                  emoji: emoji,
                  text: text,
                  timeAgo: time,
                  cardColor: _card,
                  // onLongPress: () async {
                  //   // TODO: 나중에 삭제 다이얼로그 + Firestore delete로 교체
                  //   await showDialog(
                  //     context: context,
                  //     builder: (_) => AlertDialog(
                  //       title: const Text("Delete note"),
                  //       content: const Text(
                  //         "Are you sure you want to do this?",
                  //       ),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () => Navigator.pop(context),
                  //           child: const Text("Cancel"),
                  //         ),
                  //         TextButton(
                  //           onPressed: () => Navigator.pop(context),
                  //           child: const Text("Delete"),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // },
                  onLongPress: () async {
                    final result = await showCupertinoModalPopup<String>(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: const Text("Delete note"),
                        message: const Text(
                          "Are you sure you want to do this?",
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.pop(context, "delete"),
                            child: const Text("Delete"),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context, "cancel"),
                          child: const Text("Cancel"),
                        ),
                      ),
                    );

                    if (result == "delete") {
                      // TODO: Firestore delete 연결
                    }
                  },
                );
              },
            ),
          ),

          // 하단 바 위에 얇은 라인 느낌
          Container(height: 1.2, color: Colors.black),
        ],
      ),
    );
  }
}

class _MoodCard extends StatelessWidget {
  const _MoodCard({
    required this.emoji,
    required this.text,
    required this.timeAgo,
    required this.cardColor,
    required this.onLongPress,
  });

  final String emoji;
  final String text;
  final String timeAgo;
  final Color cardColor;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black, width: 2.2),
              boxShadow: const [kShadow],
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 14.5),
                children: [
                  TextSpan(
                    text: "Mood: $emoji\n",
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            timeAgo,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
