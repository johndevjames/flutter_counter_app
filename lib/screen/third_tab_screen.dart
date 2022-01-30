
import 'package:flutter/material.dart';

class ThirdTabScreen extends StatefulWidget {
  ThirdTabScreen({Key? key, required this.check, required this.counterList,required this.callBack(int)}) : super(key: key);
  final int check;
  final List<int> counterList;
  final Function(int) callBack;

  @override
  ThirdTabScreenState createState() => ThirdTabScreenState();

}


class ThirdTabScreenState extends State<ThirdTabScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Third Page:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  widget.counterList[widget.check].toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                    onPressed: ()=>{
                      widget.callBack(widget.check)
                      // incrementCounter(widget.check)
                    },
                    child: Text('Increment me'))

              ],
            ),
          )
        );

  }
}
