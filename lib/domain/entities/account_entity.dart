import 'package:meta/meta.dart';

abstract class AccountEntity {
  final String uid;
  final String name;
  final String companyName;
  final String email;
  AccountEntity(
      {@required this.uid,
      @required this.companyName,
      @required this.name,
      @required this.email});
}
