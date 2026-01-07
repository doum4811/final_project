import 'package:final_project/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// ====== APP STYLE ======
const kBgColor = Color(0xFFE9E1BE);
const kPrimaryPink = Color(0xFFFFA6E8);
const kCardGreen = Color(0xFF6FBFAF);

const kBorderColor = Colors.black;
const kBorderWidth = 2.0;

const kShadow = BoxShadow(
  color: Colors.black,
  offset: Offset(0, 3),
  blurRadius: 0,
);
const kSoftShadow = BoxShadow(
  color: Colors.black26,
  offset: Offset(0, 2),
  blurRadius: 6,
);

/// Radius
const kPillRadius = 999.0; // 버튼, 작은 입력창
const kBoxRadius = 16.0; // Post 큰 입력 박스, 카드

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    //return MaterialApp.router(routerConfig: router);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBgColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
