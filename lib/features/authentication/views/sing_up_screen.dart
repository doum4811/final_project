import 'package:final_project/features/authentication/views/widgets/pill_button.dart';
import 'package:final_project/features/authentication/views/widgets/round_input.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // 스크린샷 느낌 색상
  static const _bg = Color(0xFFE9E1BE); // 연한 베이지
  static const _pink = Color(0xFFFFA6E8); // 연한 핑크

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEnter() {
    // TODO: Firebase signIn 연결
    debugPrint("Enter: ${_emailController.text}");
  }

  void _onCreateAccount() {
    // TODO: GoRouter로 signup 이동
    debugPrint("Go to SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Stack(
          children: [
            // 가운데 폼
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 36),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      "🔥 MOOD 🔥",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 70),
                    const Text(
                      "Join!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 폼 너비 고정 (스크린샷처럼)
                    SizedBox(
                      width: 240,
                      child: Column(
                        children: [
                          RoundedInput(
                            hintText: "Email",
                            controller: _emailController,
                            obscureText: false,
                          ),
                          const SizedBox(height: 12),
                          RoundedInput(
                            hintText: "Password",
                            controller: _passwordController,
                            obscureText: true,
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            width: 240,
                            child: PillButton(
                              text: "Create Account",
                              fillColor: _pink,
                              onPressed: _onEnter,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 하단 "Create an account →" 버튼
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: SizedBox(
                  width: 240,
                  child: PillButton(
                    text: "Log in →",
                    fillColor: _pink,
                    onPressed: _onCreateAccount,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
