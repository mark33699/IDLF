import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SliableType{
  archive,
  share,
  more,
  delete,
}

class SliableItem{

  final String title;
  final String subTitle;
  final Widget actionPane;
  final bool canDelete;

  SliableItem(this.title, this.subTitle, this.actionPane, this.canDelete);
}

class LessonPageListViewSwipe extends StatefulWidget {
  @override
  _LessonPageListViewSwipeState createState() => _LessonPageListViewSwipeState();
}

class _LessonPageListViewSwipeState extends State<LessonPageListViewSwipe> {

  List slidableItems = [
    SliableItem("Behind效果", "Action像在Tile的背面\n(最靠外面的Action最先出現)",
        SlidableBehindActionPane(), false),
    SliableItem("Scroll效果", "Action像在Tile的兩側\n(最靠中間的Action最先出現)",
        SlidableScrollActionPane(), false),
    SliableItem("Strech效果", "Action像在Tile的兩側\n(Action同時出現, 沒有重疊的感覺)",
        SlidableStrechActionPane(), false),
    SliableItem("Drawer效果", "Action像在Tile的兩側\n(Action同時出現, 會有重疊的感覺)",
        SlidableDrawerActionPane(), false),
    SliableItem("送我一程吧~~~~", "", SlidableStrechActionPane(), true),
  ];

  @override
  Widget build(BuildContext context) {

    void _showSnackBar(SliableType actionType, int index) {
      final tapInfo = "$index is ${actionType.toString()}";
      print(tapInfo);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(tapInfo),));
    }

    Widget _createSlidableListTile(int index) {

      //都用SlideAction
      final leftActionMenu = [
        SlideAction(
          child: FlutterLogo(),
          color: Colors.yellow,
          onTap: () => _showSnackBar(SliableType.archive, index),
        ),
        SlideAction(
          child: Text("tap me"),
          color: Colors.greenAccent,
          onTap: () => _showSnackBar(SliableType.share, index),
        )
      ];

      //都用IconSlideAction
      final rightActionMenu = [
        //無字
        IconSlideAction(
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar(SliableType.more, index),
        ),
        //有字
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar(SliableType.delete, index),
        )
      ];

      final slidableItem = slidableItems[index];
      return Slidable(
        actions: leftActionMenu,
        secondaryActions: rightActionMenu,
        actionPane: slidableItem.actionPane,
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            title: Text(slidableItem.title),
            subtitle: Text(slidableItem.subTitle),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('$index'),
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
            ),
          ),
        ),
      );
    }

    Widget _createSlidableDismissalListTile(int index) {

      final slidableItem = slidableItems[index];
      return Slidable(
        key: Key(slidableItem.title),
        actionPane: slidableItem.actionPane,
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            title: Text(slidableItem.title,
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ),
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
          )
        ],
        dismissal: SlidableDismissal(
          child: SlidableDrawerDismissal(),
          dismissThresholds: {SlideActionType.secondary: 0.3},
          onDismissed: (type) {
            setState(() {
              slidableItems.removeLast();
            });
          },
        ),
      );
    }

    return ListView.builder(
      itemCount: slidableItems.length,
      itemBuilder: (ctx, idx) {
        if (slidableItems[idx].canDelete) {
          return _createSlidableDismissalListTile(idx);
        } else {
          return _createSlidableListTile(idx);
        }
      }
    );
  }
}
