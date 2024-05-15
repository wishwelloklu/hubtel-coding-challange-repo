import 'dart:convert';

class TransactionModel {
  final String name;
  final int status;
  final String phone;
  final int amount;
  final String reference;
  final String type;
  final String date;
  TransactionModel({
    required this.name,
    required this.status,
    required this.phone,
    required this.amount,
    required this.reference,
    required this.type,
    required this.date,
  });

  TransactionModel copyWith({
    String? name,
    int? status,
    String? phone,
    int? amount,
    String? reference,
    String? type,
    String? date,
  }) {
    return TransactionModel(
      name: name ?? this.name,
      status: status ?? this.status,
      phone: phone ?? this.phone,
      amount: amount ?? this.amount,
      reference: reference ?? this.reference,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'status': status});
    result.addAll({'phone': phone});
    result.addAll({'amount': amount});
    result.addAll({'reference': reference});
    result.addAll({'type': type});
    result.addAll({'date': date});
  
    return result;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      name: map['name'] ?? '',
      status: map['status']?.toInt() ?? 0,
      phone: map['phone'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      reference: map['reference'] ?? '',
      type: map['type'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(name: $name, status: $status, phone: $phone, amount: $amount, reference: $reference, type: $type, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TransactionModel &&
      other.name == name &&
      other.status == status &&
      other.phone == phone &&
      other.amount == amount &&
      other.reference == reference &&
      other.type == type &&
      other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      status.hashCode ^
      phone.hashCode ^
      amount.hashCode ^
      reference.hashCode ^
      type.hashCode ^
      date.hashCode;
  }
}