// import 'package:flutter/material.dart';

// /// 분홍색 pill 버튼 (테두리 검정, 모서리 크게)
// class PillButton extends StatelessWidget {
//   const PillButton({
//     super.key,
//     required this.text,
//     required this.fillColor,
//     required this.onPressed,
//   });

//   final String text;
//   final Color fillColor;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 46,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: fillColor,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(999),
//             side: const BorderSide(color: Colors.black, width: 1.8),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.text,
    required this.fillColor,
    required this.onPressed,
  });

  final String text;
  final Color fillColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.black, width: 1.8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 4), // 살짝 떠 있는 느낌
              blurRadius: 0,
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
