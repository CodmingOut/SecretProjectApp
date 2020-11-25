import 'package:flutter/material.dart';
import 'package:secretprojectapp/virus_unit.dart';
import 'package:web_socket_channel/io.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String IP = '59.22.70.154';

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<Widget> _listItems = [];

  IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect('ws://$IP:3100');
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return Container(child: Center(child: CircularProgressIndicator()));

            String data = snapshot.data.toString();
            VirusUnit virusData = VirusUnit.fromJsonString(data);
            _listItems.insert(0, _VirusItemUnit(data: virusData));
            _listKey.currentState?.insertItem(0);

            return Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black12
                        )
                      ]
                    ),
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.close, color: Colors.red, size: 50),
                                  Text((_listItems.length - 1).toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 20
                                    )
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () {},
                        )
                      ),
                    )
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
            );
          }
        )
      ),
    );
  }

  
}

class _VirusItemUnit extends StatelessWidget {
  final VirusUnit _data;

  _VirusItemUnit({
    Key key,
    @required VirusUnit data
  })
  : assert(data != null),
    this._data = data,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            child: Container(
              height: 150,
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('보낸 사람'),
                      Text('파일명'),
                      Text('일시'),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_data.sender),
                      Text(_data.fileName),
                      Text(_data.timestamp),
                    ],
                  )
                ]
              )
            ),
            onTap: () {},
          )
        )
      )
    );
  }
}