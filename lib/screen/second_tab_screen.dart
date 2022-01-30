
import 'package:flutter/material.dart';

class SecondTabScreen extends StatefulWidget {
  SecondTabScreen({Key? key, required this.check, required this.counterList,required this.callBack(int)}) : super(key: key);
  final int check;
  final List<int> counterList;
  final Function(int) callBack;

  @override
  SecondTabScreenState createState() => SecondTabScreenState();

}


class SecondTabScreenState extends State<SecondTabScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Second Page:',
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
