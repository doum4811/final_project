import 'package:flutter/material.dart';

class MoodHeader extends StatelessWidget {
  const MoodHeader({super.key, this.right});

  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          // 가운데 영역 (오른쪽 버튼 침범 방지)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: const Text(
                "🔥 MOOD 🔥",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ),

          // 오른쪽 버튼
          if (right != null)
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(child: right),
            ),
        ],
      ),
    );
  }
}
