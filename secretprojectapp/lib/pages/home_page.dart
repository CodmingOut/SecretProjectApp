import 'package:flutter/material.dart';
import 'package:secretprojectapp/dummy/stream_dummy.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<Widget> _listItems = [];

  @override
  void initState() {
    super.initState();
    _listenStream(getStreamDummy(5));
  }

  void _listenStream(Stream<String> stream) {
    stream.listen((data) {
      _listItems.insert(0, _buildItem(data));
      if(_listKey.currentState == null) return;
      _listKey.currentState.insertItem(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                height: 150,
              ),
              Expanded(
                child: Container(
                  child: AnimatedList(
                    padding: EdgeInsets.only(top: 20),
                    key: _listKey,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: CurvedAnimation(
                          curve: Curves.easeOut,
                          parent: animation
                        ).drive(Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset(0, 0)
                        )),
                        child: _listItems[index],
                      );
                    }
                  )
                )
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _buildItem(String data) {
    return GestureDetector(
      child: Container(
        height: 100,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 150,
            padding: EdgeInsets.all(15),
            child: Text(data)
          )
        )
      ),
      onTap: () {},
    );
  }
}