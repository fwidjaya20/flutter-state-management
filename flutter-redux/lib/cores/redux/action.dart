import 'package:meta/meta.dart';

abstract class Action {
  String type;
  dynamic payload;

  Action({
    @required this.type,
    @required this.payload,
  });
}
