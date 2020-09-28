import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SliableType{
  Archive,
  Share,
  More,
  Delete,
}

class SliableItem{

  final String title;
  final String subTitle;
  final Widget actionPane;

  SliableItem(this.title, this.subTitle, this.actionPane);
}

class LessonPageListViewSwipe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final slidableItems = [
      SliableItem("Behind效果", "Action像在Tile的背面\n(最靠外面的Action最先出現)",
          SlidableBehindActionPane()),
      SliableItem("Scroll效果", "Action像在Tile的兩側\n(最靠中間的Action最先出現)",
          SlidableScrollActionPane()),
      SliableItem("Strech效果", "Action像在Tile的兩側\n(Action同時出現, 沒有重疊的感覺)",
          SlidableStrechActionPane()),
      SliableItem("Drawer效果", "Action像在Tile的兩側\n(Action同時出現, 會有重疊的感覺)",
          SlidableDrawerActionPane()),
    ];

    void _showSnackBar(SliableType actionType, int index) {
      print("${actionType.toString()} & $index");
    }

    Widget _createSlidableListTile(int index) {

      //都用SlideAction
      final leftActionMenu = [
        SlideAction(
          child: FlutterLogo(colors: Colors.black12),
          color: Colors.blue,
          onTap: () => _showSnackBar(SliableType.Archive, index),
        ),
        SlideAction(
          child: Text("tap me"),
          color: Colors.indigo,
          onTap: () => _showSnackBar(SliableType.Share, index),
        )
      ];

      //都用IconSlideAction
      final rightActionMenu = [
        //有字
        IconSlideAction(
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar(SliableType.More, index),
        ),
        //沒字
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar(SliableType.Delete, index),
        )
      ];

      final slidableItem = slidableItems[index];

      return Slidable(
        actions: leftActionMenu,
        secondaryActions: rightActionMenu,
        actionPane: slidableItem.actionPane,
        actionExtentRatio: (index + 1) * 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            title: Text(slidableItem.title),
            subtitle: Text(slidableItem.subTitle),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('$index'),
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigoAccent,
            ),
          ),
        ),
      );
    }

    return ListView.builder(itemBuilder: null);
  }
}
