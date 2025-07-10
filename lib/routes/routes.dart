import 'package:flutter/material.dart';

import '../pages/chat/chat_page.dart';
import '../pages/user/users_page.dart';
import '../auth/login/login_page.dart';
import '../pages/loading/loading_page.dart';
import '../auth/register/register_page.dart';
import '../pages/term_condicions/terms_condicions_page.dart';
import '../pages/term_condicions/privacy_page.dart';
import '../pages/root.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'chat': (_) => ChatPage(username: ''),
  'user': (_) => const UsersPage(username: ''),
  'login': (_) => const LoginPage(),
  'loading': (_) => const LoadingPage(),
  'registro': (_) => const RegisterPage(),

  'terms': (_) => TermsPage(),
  'privacy': (_) => PrivacyPage(),

  'root': (_) => const RootPage(),
};
