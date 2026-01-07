import 'package:final_project/features/authentication/views/login_screen.dart';
import 'package:final_project/features/mood/views/home_screen.dart';
import 'package:final_project/features/mood/views/main_nav_screen.dart';
import 'package:final_project/features/mood/views/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   return GoRouter(
//     initialLocation: '/',
//     routes: [
//       GoRoute(path: "/", builder: (context, state) => const MainNavScreen()),

//       // GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
//       GoRoute(
//         path: '/search',
//         builder: (context, state) => const SearchScreen(),
//       ),
//     ],
//   );
// });

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Search")),
//       body: Center(child: Text("Search Screen")),
//     );
//   }
// }

final routerProvider = Provider<GoRouter>((ref) {
  // final auth = ref.watch(authStateProvider);

  return GoRouter(
    // initialLocation: "/",
    initialLocation: "/login",
    // refreshListenable: GoRouterRefreshStream(
    //   ref.read(authRepositoryProvider).authStateChanges(),
    // ),
    // redirect: (context, state) {
    //   final isLoggedIn = auth.valueOrNull != null;
    //   final goingToAuth = state.matchedLocation == "/login" ||
    //       state.matchedLocation == "/signup";

    //   if (!isLoggedIn && !goingToAuth) return "/login";
    //   if (isLoggedIn && goingToAuth) return "/";
    //   return null;
    // },
    routes: [
      GoRoute(path: "/", builder: (context, state) => const MainNavScreen()),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
      // GoRoute(path: "/post", builder: (context, state) => const PostScreen()),

      // GoRoute(
      //   path: "/signup",
      //   builder: (context, state) => const SignUpScreen(),
      // ),
    ],
  );
});

// /// GoRouterRefreshStream 유틸
// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     _sub = stream.listen((_) => notifyListeners());
//   }
//   late final StreamSubscription<dynamic> _sub;

//   @override
//   void dispose() {
//     _sub.cancel();
//     super.dispose();
//   }
// }
