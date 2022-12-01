import 'package:cloud_firestore/cloud_firestore.dart';

class JsonHelper {
  static DateTime? fromTimestamp(dynamic obj) {
    return (obj as Timestamp?)?.toDate();
  }

  static Timestamp? toTimestamp(DateTime? obj) {
    if (obj == null) return null;

    return Timestamp.fromDate(obj);
  }
}
