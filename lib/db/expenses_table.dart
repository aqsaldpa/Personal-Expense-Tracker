import 'package:drift/drift.dart';

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get category =>
      text().withDefault(const Constant('other'))();
}
