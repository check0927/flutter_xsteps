import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'flutter_xsteps.dart';

class ExamplePage extends StatefulWidget {
  final resultData = {
    {
      "title": "step1",
      "subTitle": "05-08-2020  12:00",
      "content": "In person meeting"
    },
    {
      "title": "step2",
      "subTitle": "05-05-2020  15:10",
      "content": "Phone call"
    },
    {
      "title": "step3",
      "subTitle": "05-05-2020  15:06",
      "content": "Accepted from \"Covid 19 Promotion\""
    },
  };

  @override
  State<StatefulWidget> createState() {
    return ExampleState();
  }
}

class ExampleState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> mChildrens = List();
    for (var feedDataItem in widget.resultData) {
      mChildrens.add(_buildRStepsItemView(feedDataItem));
    }
    return Container(
      child: Xsteps(
        current: 1,
        childrens: mChildrens,
      ),
      margin: EdgeInsets.only(
          top: ScreenUtil().setWidth(36),
          bottom: ScreenUtil().setWidth(60),
          left: ScreenUtil().setWidth(19)),
    );
  }

  _buildRStepsItemView(itemData) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Offstage(
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setWidth(0),
                  bottom: ScreenUtil().setWidth(10)),
              child: Text(
                itemData['title'],
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Color(0xff2F80ED),
                    fontWeight: FontWeight.bold),
              ),
            ),
            offstage: itemData['title'] == '',
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(0),
                bottom: ScreenUtil().setWidth(10)),
            child: Text(
              itemData['subTitle'],
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Color(0xff828282),
              ),
            ),
          ),
          Container(
            child: Text(
              itemData['content'],
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: Color(0xff201A3D),
              ),
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(
          bottom: ScreenUtil().setWidth(20),
          left: ScreenUtil().setWidth(29),
          top: ScreenUtil().setWidth(1)),
    );
  }
}
