library flutter_xsteps;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'binding_helper.dart';

class Xsteps extends StatefulWidget {
  final int current;
  final List<Widget> childrens;
  final Color outColor;
  final Color innerSelectColor;
  final Color innerUnSelectColor;

  Xsteps(
      {this.current,
      this.childrens,
      this.innerSelectColor = const Color(0xff3B8CFF),
      this.innerUnSelectColor = const Color(0xffbdbdbd),
      this.outColor = const Color(0xffbdbdbd)})
      : assert(current != null),
        assert(childrens != null);

  @override
  State<StatefulWidget> createState() {
    return XstepsState();
  }
}

class XstepsState extends State<Xsteps> {
  List<double> heights = List();

  @override
  Widget build(BuildContext context) {
    List<Widget> mViews = List();
    for (int i = 0; i < widget.childrens.length; i++) {
      Widget childrenItem = widget.childrens[i];
      List<Widget> rowWidgets = List();
      rowWidgets.add(buildItemProgress(i));
      rowWidgets.add(RectProvider(
        child: childrenItem,
        onGetRect: (Rect r) {
          heights.add(r.height);
          if (i == widget.childrens.length - 1) {
            setState(() {});
          }
        },
      ));
      Row row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rowWidgets,
      );
      mViews.add(row);
    }
    Column columnProgress = Column(
      children: mViews,
    );
    return columnProgress;
  }

  buildItemProgress(int index) {
    return Container(
      alignment: Alignment.topCenter,
      width: ScreenUtil().setWidth(15),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Offstage(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(77, 59, 140, 255),
                          shape: BoxShape.circle),
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setWidth(15),
                    ),
                    offstage: index != widget.current,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: index > widget.current
                            ? widget.innerUnSelectColor
                            : widget.innerSelectColor,
                        shape: BoxShape.circle),
                    width: ScreenUtil().setWidth(9),
                    height: ScreenUtil().setWidth(9),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: index != widget.current
                        ? ScreenUtil().setWidth(9)
                        : ScreenUtil().setWidth(12)),
                height: heights.length == widget.childrens.length
                    ? heights[index]
                    : 0,
                width: ScreenUtil().setWidth(1),
                color: index >= widget.current
                    ? widget.outColor
                    : widget.innerSelectColor,
              )
            ],
          )
        ],
      ),
//      height: ScreenUtil() .setWidth(70),
    );
  }

  setStepsHeight(double height) {
    setState(() {});
  }
}
