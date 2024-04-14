import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_test/controller/main_home_controller.dart';

class CustomBottomBar extends ConsumerStatefulWidget {
  const CustomBottomBar(
      {super.key, required this.initialIndex, required this.pageLength});

  final int initialIndex;
  final int pageLength;

  @override
  ConsumerState<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends ConsumerState<CustomBottomBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      initialIndex: widget.initialIndex,
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width / 15;
    final index = ref.watch(navBarProvider);
    if (index == 0) {
      tabController.animateTo(0);
    } else if (index == 1) {
      tabController.animateTo(1);
    } else if (index == 2) {
      tabController.animateTo(2);
    } else if (index == 3) {
      tabController.animateTo(3);
    }

    Color unSelectedColor = theme.colorScheme.onSurface;
    var iconMargin = EdgeInsets.only(bottom: Platform.isIOS ? 15 : 5);
    final double tabBarHeight = Platform.isIOS ? 100 : 100;
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        unselectedLabelColor: unSelectedColor,
        indicator: const BoxDecoration(),
        indicatorSize: TabBarIndicatorSize.tab,
        splashFactory: InkRipple.splashFactory,
        overlayColor:
            MaterialStateProperty.resolveWith((states) => Colors.transparent),
        indicatorPadding: EdgeInsets.only(left: width, right: width),
        labelPadding: EdgeInsets.zero,
        labelColor: Colors.black,
        onTap: (value) {
          ref.read(navBarProvider.notifier).onNavItemTap(value);
        },
        tabs: [
          Tab(
            height: tabBarHeight,
            iconMargin: iconMargin,
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFCCF3EF)),
                  child: SvgPicture.asset(
                    "assets/svgs/home.svg",
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                )
              ],
            ),
            text: "Home",
          ),
          Tab(
            height: tabBarHeight,
            iconMargin: iconMargin,
            icon: SvgPicture.asset(
              "assets/svgs/send.svg",
            ),
            text: "Send",
          ),
          Tab(
            height: tabBarHeight,
            iconMargin: iconMargin,
            icon: SvgPicture.asset(
              "assets/svgs/history.svg",
            ),
            text: "History",
          ),
          Tab(
            height: tabBarHeight,
            iconMargin: iconMargin,
            icon: SvgPicture.asset(
              "assets/svgs/schedule.svg",
            ),
            text: "Scheduled",
          ),
        ],
      ),
    );
  }
}
