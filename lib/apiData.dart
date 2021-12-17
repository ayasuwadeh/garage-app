import 'package:firebase_database/firebase_database.dart';
import 'status.dart';
import 'status.dart';
class MessageDao {
  Future<Status> getData() async {
    String result = (await FirebaseDatabase.instance.reference().child(
        "status").once()).value;
    Status s=new Status();
    s.splitData(result);
    return s;
  }


}