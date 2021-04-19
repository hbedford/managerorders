import 'package:meta/meta.dart';

abstract class AccessoryEntity {
  final String uid;
  final String title;
  AccessoryEntity({@required this.uid, @required this.title});
}
