import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_app/controllers/firebaseRealTimeDatabase.dart';
import 'package:flutter_counter_app/notifiers/notifiers.dart';

import 'first_tab_screen.dart';
import 'second_tab_screen.dart';
import 'third_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
  SelectTabNotifier selectTabNotifier = SelectTabNotifier(0);


}

class _HomeScreenState extends State<HomeScreen> {
  int _firstCounter = 0;
  int _secondCounter = 0;
  int _thirdCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomNavigationBar(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
            onPressed:()=>{
            _clearCounter()

            },
            icon: Icon(Icons.refresh),
        )
      ],
    );
  }

  Center buildBody() {
    return Center(
      child:ValueListenableBuilder(
          valueListenable: widget.selectTabNotifier,
          builder: (BuildContext context, dynamic value, Widget? child) {
          return FutureBuilder<FirebaseApp>(
              future:Firebase.initializeApp(),
              builder: (context, snapshot) {
                if(snapshot.hasData)
              return FutureBuilder<Counters>(
                  future: fetchCounterData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      _firstCounter = snapshot.data!.counterOne!;
                      _secondCounter = snapshot.data!.counterTwo!;
                      _thirdCounter = snapshot.data!.counterThree!;
                      List<int> counterList=[
                        _firstCounter,_secondCounter,_thirdCounter
                      ];
                      return IndexedStack(
                        index: widget.selectTabNotifier.value,
                        children: <Widget>[
                          FirstScreen(counterList: counterList,counterPosition: value,callBack:(int) => _incrementCounter(int)),
                          SecondTabScreen(counterList: counterList,counterPosition: value,callBack:(int) => _incrementCounter(int)),
                          ThirdTabScreen(counterList: counterList,counterPosition: value,callBack:(int) => _incrementCounter(int)),
                        ],

                      );
                    }else
                    return CupertinoActivityIndicator(radius: 50,);
                }
              );
                else
                  return CupertinoActivityIndicator(radius: 50,);
            }
          );
        }
      )

    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: ()=>_incrementCounter(widget.selectTabNotifier.getTabItem()),
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }

  ValueListenableBuilder<int> buildBottomNavigationBar() {
    return ValueListenableBuilder(
        valueListenable: widget.selectTabNotifier,
        builder: (BuildContext context, dynamic value, Widget? child) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Counter 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Counter 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Counter 3',
            ),
          ],
          currentIndex: value,
          selectedItemColor: Colors.red[800],
          onTap:(index) => widget.selectTabNotifier.changeTab(index),
        );
      }
    );
  }

  void _incrementCounter(int position) {
    setState(() {
      if(position == 0)
        _firstCounter++;
      if(position == 1)
        _secondCounter++;
      if(position == 2)
        _thirdCounter++;
      setCounterData(_firstCounter,_secondCounter,_thirdCounter);
    });
  }

  void _clearCounter() {
    return setState(() {
      _firstCounter = 0;
      _secondCounter = 0;
      _thirdCounter = 0;
      setCounterData(_firstCounter,_secondCounter,_thirdCounter);
    });
  }


}

