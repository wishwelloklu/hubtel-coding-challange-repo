import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hubtel_test/externsions/strings_extersnion.dart';
import 'package:hubtel_test/model/transaction.dart';

final transactionProvider = AsyncNotifierProvider.autoDispose<
    TransactionController,
    Map<String, List<TransactionModel>>>(() => TransactionController());

class TransactionController
    extends AutoDisposeAsyncNotifier<Map<String, List<TransactionModel>>> {
  @override
  Future<Map<String, List<TransactionModel>>> build() async {
    state = AsyncLoading();
    await getTransactions();
    return state.value ?? {};
  }

  Future<void> getTransactions() async {
    final String response =
        await rootBundle.loadString('assets/json/sample.json');

    final List data = await json.decode(response);

    final decodedData = data
        .map((transaction) => TransactionModel.fromMap(transaction))
        .toList();

    Map<String, List<TransactionModel>> groupedData = {};
    for (var item in decodedData) {
      String date = item.date.dateTime();
      if (!groupedData.containsKey(date)) {
        groupedData[date] = [];
      }
      groupedData[date]!.add(item);
    }
    log(groupedData.toString());
    state = AsyncData(groupedData);
  }
}
