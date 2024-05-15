import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_test/externsions/strings_extersnion.dart';
import 'package:hubtel_test/model/history.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.data,
  });

  final TransactionModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE6EAED),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data.date.convertTo12HourFormat(),
                  style: const TextStyle(
                    color: Color(0xFF9CABB8),
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(data.logo),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                data.name,
                                style: const TextStyle(fontSize: 14),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                  color: data.status == 1
                                      ? const Color(0xFFDBF7E0)
                                      : const Color(0xFFFDB0AC),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  SvgPicture.asset(data.status == 1
                                      ? "assets/svgs/check.svg"
                                      : "assets/svgs/failed.svg"),
                                  const SizedBox(width: 4),
                                  Text(
                                    data.status == 1 ? "Successful" : "Failed",
                                    style: TextStyle(
                                      color: data.status == 1
                                          ? const Color(0xFF70E083)
                                          : const Color(0xFF99231D),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                data.phone,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF9EADBA),
                                ),
                              ),
                            ),
                            Text(
                              "GHS ${data.amount}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w900),
                            )
                          ],
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
                      const SizedBox(width: 8),
                      Text(
                        data.type,
                        style: const TextStyle(
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
                      Text(
                        data.reference,
                        style: const TextStyle(
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
