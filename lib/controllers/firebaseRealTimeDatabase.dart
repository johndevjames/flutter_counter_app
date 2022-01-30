
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<Counters> fetchCounterData() async {
  DatabaseReference ref = FirebaseDatabase.instanceFor(app: Firebase.app(),
      databaseURL:'https://counter-app-961b0-default-rtdb.asia-southeast1.firebasedatabase.app')
      .ref("counters");
  DatabaseEvent event = await ref.once();
  print(event.snapshot.value);
  Map map = event.snapshot.value as Map;
  return Counters.fromJson(map);
}

 setCounterData(int counterOne,int counterTwo,int counterThree) async {
   FirebaseApp defaultApp = Firebase.app();
   DatabaseReference ref = FirebaseDatabase.instanceFor(app: defaultApp,
       databaseURL:'https://counter-app-961b0-default-rtdb.asia-southeast1.firebasedatabase.app')
       .ref("counters");

  Counters counters = new Counters(counterOne: counterOne,counterTwo:counterTwo,counterThree: counterThree );
  await ref.set(counters.toJson());
}
class CounterDetails {
  Counters? counters;

  CounterDetails({this.counters});

  CounterDetails.fromJson(Map<String, dynamic> json) {
    counters = json['counters'] != null ? new Counters.fromJson(json['counters']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.counters != null) {
      data['counters'] = this.counters!.toJson();
    }
    return data;
  }
}

class Counters {
  int? counterOne;
  int? counterTwo;
  int? counterThree;

  Counters({this.counterOne, this.counterTwo, this.counterThree});

  Counters.fromJson(Map json) {
    counterOne = json['counterOne'];
    counterTwo = json['counterTwo'];
    counterThree = json['counterThree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counterOne'] = this.counterOne;
    data['counterTwo'] = this.counterTwo;
    data['counterThree'] = this.counterThree;
    return data;
  }
}
