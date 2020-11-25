import 'package:flutter/material.dart';
import 'package:secretprojectapp/bar_widget.dart';
import 'package:secretprojectapp/virus_unit.dart';

class MailPageArguments {
  VirusUnit virusUnit;
  MailPageArguments(this.virusUnit);
}

class MailPage extends StatelessWidget {
  static const String routeName = '/mail_page';

  @override
  Widget build(BuildContext context) {
    MailPageArguments arguments = ModalRoute.of(context).settings.arguments;
    VirusUnit virusUnit = arguments.virusUnit;

    return Scaffold(
      body: SafeArea(
        child: BarWidget(
          title: '메일 보기',
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text(
                virusUnit.mailTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '보낸 사람',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16
                            ),
                          ),
                          Text(
                            '일시',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16
                            )
                          ),
                        ],
                      )
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          virusUnit.sender,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16
                          ),
                        ),
                        Text(
                          virusUnit.time.toString(),
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16
                          ),
                        ),
                      ],
                    )
                  ]
                )
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[350],
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 95,
                      child: Text(
                        '검출된 파일',
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: 16
                        ),
                      )
                    ),
                    Text(
                      virusUnit.fileName,
                      style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 16
                      ),
                    )
                  ]
                )
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey[350],
              ),
              SizedBox(height: 10),
              Text(
                virusUnit.mailContent,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}