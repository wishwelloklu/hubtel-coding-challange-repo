import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_test/components/text_field.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
              body: Container(
                margin: const EdgeInsets.only(top: 10),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [
                        SizedBox(height: 30),
                        DateWidget(),
                        SizedBox(height: 16),
                        MainWidget(),
                        SizedBox(height: 10),
                        MainWidget(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 2,
                ),
              ),
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
                backgroundColor: const Color(0xfff01c7b1),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE6EAED),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "14:45PM",
                  style: TextStyle(
                    color: Color(0xFF9CABB8),
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/MTN Mobile Money.png"),
                        const SizedBox(width: 8),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Emmanuel Rockson",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Kwabena Uncle Ebo",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              "024 123 4567",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF9EADBA),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xFFDBF7E0),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/svgs/check.svg"),
                        const SizedBox(width: 4),
                        const Text(
                          "Success",
                          style: TextStyle(
                            color: Color(0xFF70E083),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/profile.svg"),
                      const Text(
                        "Personal",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 4.34,
                        width: 4.26,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF9CABB8)),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Cool your heart wai",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.star,
                      color: Color(0xFFFEE066),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        label: const Text(
          "May 24, 2022",
          style: TextStyle(
            color: Color(0xFF9CABB8),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFE6EAED),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
