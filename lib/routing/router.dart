import 'package:flutter/cupertino.dart';
import 'package:gather/features/authentication/ui/signin.dart';
import 'package:gather/features/authentication/ui/signup.dart';
import 'package:gather/features/chat/ui/chat.dart';
import 'package:gather/features/chat/ui/personal_chat_page.dart';
import 'package:gather/features/common/splash.dart';
import 'package:gather/layout.dart';
import 'package:gather/features/activity/ui/create_activity.dart';
import 'package:gather/features/explore/ui/explore.dart';
import 'package:gather/features/home/ui/home.dart';
import 'package:gather/features/notification/ui/notifications.dart';
import 'package:gather/features/profile/ui/profile.dart';
import 'package:gather/features/profile/ui/settings.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.loading,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              LayoutScaffold(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.homePage,
              builder: (context, state) => const Home(),
              routes: [
                GoRoute(
                  path: Routes.notifications,
                  builder: (context, state) => const Notifications(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.locate,
              builder: (context, state) => const Explore(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.addEvent,
              builder: (context, state) => const CreateActivity(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.chat,
              builder: (context, state) => const Chat(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const Profile(),
              routes: [
                GoRoute(
                  path: Routes.settings,
                  builder: (context, state) => const Settings(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(path: Routes.loading, builder: (context, state) => Splash()),
    GoRoute(
      path: '/personalChat/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return PersonalChatPage(userId: id);
      },
    ),
  ],
);
