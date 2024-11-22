import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tripwise/pages/user/welcome_user.dart';
import 'package:tripwise/provider/auth_provider.dart';
import 'package:tripwise/shared/main_navigator.dart';

class AppNavigator extends ConsumerWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.when(
      data: (user) =>
          user == null ? const WelcomeScreen() : const MainNavigator(),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => const Scaffold(
        body: Center(child: Text('Error loading auth status')),
      ),
    );
  }
}
