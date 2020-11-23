import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  final Widget _child;
  final String _title;
  final Widget _titleWidget;
  final Widget _action;
  final dynamic _popData;

  /// If `titleWidget` is null, `title` which is wrapped by Text widget substitute `titleWidget`.
  BarWidget({
    @required Widget child,
    String title = '',
    Widget titleWidget,
    Widget action,
    dynamic popData
  })
  : assert(child != null),
    _child = child,
    _title = title,
    _titleWidget = titleWidget,
    _action = action,
    _popData = popData;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      _title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );

    Widget titleWidget = _titleWidget ?? textWidget;

    List<Widget> stackChildren = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context, _popData)
          ),
          titleWidget
        ],
      )
    ];

    if(_action != null) {
      stackChildren.add(
        Align(
          alignment: Alignment.centerRight,
          child: _action,
        )
      );
    }

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: _child
        ),
        Container( // Upper bar
          height: 50,
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              children: stackChildren,
            )
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
              )
            ]
          )
        )
      ],
    );
  }
}