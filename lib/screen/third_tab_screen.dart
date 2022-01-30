
import 'package:flutter/material.dart';

class ThirdTabScreen extends StatefulWidget {
  ThirdTabScreen({Key? key, required this.counterPosition, required this.counterList,required this.callBack(int)}) : super(key: key);
  final int counterPosition;
  final List<int> counterList;
  final Function(int) callBack;

  @override
  ThirdTabScreenState createState() => ThirdTabScreenState();

}


class ThirdTabScreenState extends State<ThirdTabScreen> {
  late int index;

  @override
  Widget build(BuildContext context) {
    index = widget.counterList[widget.counterPosition];

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
                  'Counter $index',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                    onPressed: ()=>{
                      widget.callBack(widget.counterPosition)
                      // incrementCounter(widget.check)
                    },
                    child: Text('Increment me'))

              ],
            ),
          )
        );

  }
}
