
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key, required this.check, required this.counterList,required this.callBack(int)}) : super(key: key);
  final int check;
  final List<int> counterList;
  final Function(int) callBack;

  @override
  FirstScreenState createState() => FirstScreenState();

}


class FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'First Page:',
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
