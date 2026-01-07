import 'package:final_project/features/mood/views/home_screen.dart';
import 'package:final_project/features/mood/views/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  static const routeName = "mainNav";
  static const tabs = ["", "/post"]; // "/" , "/post"

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  // 스크린샷 느낌 색상들
  static const _bg = Color(0xFFE9E1BE); // 연한 베이지
  static const _card = Color(0xFF6FBFAF); // 민트/그린 카드
  int _selectedIndex = 0;

  void _onTap(int index) {
    // ✅ TA 힌트: route 이동 + index setState 둘 다
    context.go("/${MainNavScreen.tabs[index]}");
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            // child: const _HomeTab(),
            child: HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            // child: const _PostTab(),
            child: PostScreen(),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onTap,
      //   backgroundColor: _bg,
      //   elevation: 0,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.edit), label: ""),
      //   ],
      // ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 1.0)),
        ),
        padding: const EdgeInsets.only(top: 15), // 🔥 구분선과 아이콘 거리
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTap,
          backgroundColor: _bg,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: ""),
            // BottomNavigationBarItem(
            //   icon: FaIcon(FontAwesomeIcons.house),
            //   label: "",
            // ),
            // BottomNavigationBarItem(
            //   icon: FaIcon(FontAwesomeIcons.pen),
            //   label: "",
            // ),
          ],
        ),
      ),
    );
  }
}
