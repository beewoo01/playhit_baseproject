import 'package:baseproject/screens/samples/home/screen/home_root.dart';
import 'package:baseproject/screens/samples/login/sign_in_screen.dart';
import 'package:baseproject/utils/router/route_paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RoutePaths.SIGN_IN,
  routes: [
    GoRoute(
      path: RoutePaths.SIGN_IN,
      builder: (context, state) => SignInScreen(
        onAction: () => context.go(RoutePaths.HOME),
      ),
    ),
    GoRoute(
      path: RoutePaths.HOME,
      builder: (context, state) => HomeRoot(),
    ),
  ],
);
/*
*/
