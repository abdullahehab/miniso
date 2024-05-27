import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../component/nav_bar.dart';
import '../controllers/providers/navigation_provider.dart';


class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(navigationProvider);
    final notifier = ref.watch(navigationProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: notifier.screens[provider.currentIndex],
      bottomNavigationBar: NavBar(
        onDestinationSelected: notifier.changeScreen,
        selectedIndex: provider.currentIndex,
      ),
    );
  }
}
