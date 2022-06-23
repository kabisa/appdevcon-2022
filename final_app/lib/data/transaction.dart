class Transaction {
  final num kudos;
  final String fromName;
  final String toName;
  final String note;
  final DateTime createdAt;

  Transaction(
      {required this.kudos,
      required this.fromName,
      required this.toName,
      required this.note,
      required this.createdAt});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          kudos == other.kudos &&
          fromName == other.fromName &&
          toName == other.toName &&
          note == other.note &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      kudos.hashCode ^
      fromName.hashCode ^
      toName.hashCode ^
      note.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return '$fromName gave $kudos₭ to $toName for $note';
  }
}
