import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class LessonPageCustomScrollView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final space = 10.0;
    final tintColor = Colors.pinkAccent.withOpacity(0.5);

    Widget _createCell(String title) {
      return Container(
        color: tintColor,
        child: Center(
          child: Text(title, style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w500
          )),
        ),
      );
    }

    Widget buildNoArrowRefreshIndicator(
        BuildContext context,
        RefreshIndicatorMode refreshState,
        double pulledExtent,
        double refreshTriggerPullDistance,
        double refreshIndicatorExtent,
        ) {
      const Curve opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: refreshState == RefreshIndicatorMode.drag
              ? Opacity(
            opacity: opacityCurve.transform(
                min(pulledExtent / refreshTriggerPullDistance, 1.0)
            ),
            child: Icon(
              CupertinoIcons.car_detailed,
              color: CupertinoDynamicColor.resolve(CupertinoColors.inactiveGray, context),
              size: 36.0,
            ),
          )
              : Opacity(
            opacity: opacityCurve.transform(
                min(pulledExtent / refreshIndicatorExtent, 1.0)
            ),
            child: const CupertinoActivityIndicator(radius: 14.0),
          ),
        ),
      );
    }

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[

          //頂
          SliverAppBar(
            backgroundColor: tintColor,
            pinned: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("第十三堂課"),
              background: Image.asset("resource/images/fantasy_unicorn.jpg",
                fit: BoxFit.cover
              ),
            ),
          ),

          //拉
          CupertinoSliverRefreshControl(
            builder: buildNoArrowRefreshIndicator,
            onRefresh: () async {
              print("拉爽的");
            },
          ),

          //上
          SliverPadding(
            padding: EdgeInsets.all(space),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((ctx, idx){
                return _createCell("Grid $idx");
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: space,
                crossAxisSpacing: space,
                childAspectRatio: 1
              )
            ),
          ),

          //中
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate ( (ctx, idx) {
              return _createCell("List $idx");
            }, childCount: 1 )
          ),

        ],
      ),
    );
  }
}