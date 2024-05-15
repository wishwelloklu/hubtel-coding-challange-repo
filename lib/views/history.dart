import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_test/components/text_field.dart';
import 'package:hubtel_test/controller/history_controller.dart';
import 'package:hubtel_test/views/widgets/date_widget.dart';
import 'package:hubtel_test/views/widgets/main_widget.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});

  @override
  ConsumerState<History> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
  final showPage = ValueNotifier(false);

  @override
  void initState() {
    showHistoryFunc();

    super.initState();
  }

  Future showHistoryFunc() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      showPage.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionData = ref.watch(transactionProvider);
    return ValueListenableBuilder<bool>(
        valueListenable: showPage,
        builder: (context, value, child) {
          if (value) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                toolbarHeight: 143,
                title: Column(
                  children: [
                    Container(
                      height: 55,
                      margin: const EdgeInsets.only(top: 42),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFE6EAED),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: const Text(
                                "History",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFFE6EAED),
                              ),
                              child: Text(
                                "Transcation Summary",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.2),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        Expanded(
                          child: textFormField(
                            hintText: "Search",
                            context: context,
                            controller: TextEditingController(),
                            focusNode: FocusNode(),
                            backgroundColor: const Color(0xFFE6EAED),
                            prefixIcon: Icons.search,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/svgs/settings.svg"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              body: transactionData.when(
                  data: (data) {
                    if (data.isNotEmpty) {
                      List<Widget> items = [];
                      data.forEach((date, item) {
                        items.add(Column(
                          children: [
                            const SizedBox(height: 10),
                            DateWidget(date: date),
                          ],
                        ));
                        items.add(Column(
                          children: item.map((e) {
                            return MainWidget(data: e);
                          }).toList(),
                        ));
                      });
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemBuilder: (context, index) {
                                return items[index];
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: items.length,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(child: Text("Oops, Nothing here"));
                  },
                  error: (error, stackTrace) {
                    return const Center(
                        child: Text("Oops, an error has occured"));
                  },
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {},
                label: const Text(
                  "SEND NEW",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xff01c7b1),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
