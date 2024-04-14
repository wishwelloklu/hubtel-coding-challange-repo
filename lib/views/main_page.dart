import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hubtel_test/controller/main_home_controller.dart';
import 'package:hubtel_test/views/botton_bar.dart';
import 'package:hubtel_test/views/homepage.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(navBarProvider);
    List pages = [
      Container(),
      Container(),
      Homepage(),
      Container(),
    ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: CustomBottomBar(
        initialIndex: index,
        pageLength: pages.length,
      ),
    );
  }
}
