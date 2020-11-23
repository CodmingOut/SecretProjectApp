import 'package:flutter/material.dart';
import 'package:secretprojectapp/dummy/stream_dummy.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<String>(
          stream: getStreamDummy(5),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return Container(alignment: Alignment.center, child: CircularProgressIndicator());
            print(snapshot.data);
            return Container();
          },
        ),
      ),
    );
  }
}