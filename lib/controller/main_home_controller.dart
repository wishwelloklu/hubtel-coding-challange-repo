import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarProvider = StateNotifierProvider<NavBarController, int>((ref)=> NavBarController(ref));

class NavBarController extends StateNotifier<int> {
  final Ref ref;
  NavBarController(this.ref) : super(0);

  void onNavItemTap(int index) {
    ref.read(navBarProvider.notifier).state = index;
  }
}
