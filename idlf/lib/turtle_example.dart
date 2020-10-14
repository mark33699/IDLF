import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class TurtleExample extends StatefulWidget {
  @override
  _TurtleExampleState createState() => _TurtleExampleState();
}

class _TurtleExampleState extends State<TurtleExample> {

  var currentCommands = [];
  var title = "雪";

  @override
  Widget build(BuildContext context) {

    final snowScale = 3;

    var snowCommands = [
      SetMacro('snowflake', [
        IfElse((_) => _['long_side'] <= 10, [
          PenDown(),
          Forward((_) => _['long_side']),
          PenUp(),
        ], [
          RunMacro('snowflake', (_) => {'long_side': _['long_side'] / snowScale}),
          Forward((_) => _['long_side'] / snowScale),
          Left((_) => 60),

          RunMacro('snowflake', (_) => {'long_side': _['long_side'] / snowScale}),
          Forward((_) => _['long_side'] / snowScale),
          Right((_) => 120),

          RunMacro('snowflake', (_) => {'long_side': _['long_side'] / snowScale}),
          Forward((_) => _['long_side'] / snowScale),
          Left((_) => 60),

          RunMacro('snowflake', (_) => {'long_side': _['long_side'] / snowScale}),
          Forward((_) => _['long_side'] / snowScale),
        ])
      ]),

      SetColor((_) => Colors.blue),
      Forward((_) => MediaQuery.of(context).size.height / 4),
      Left((_) => 90),
      Forward((_) => MediaQuery.of(context).size.width / 4),
      Right((_) => 90),

      PenDown(),
      Repeat((_) => 3, [
        Right((_) => 120),
        RunMacro('snowflake', (_) => {'long_side': 300.0}),
        Forward((_) => 300),
      ]),
    ];

    var treeCommands = [
      SetMacro('tree', [
        IfElse((_) => _['size'] < 5.0, [
          Forward((_) => _['size']),
          Back((_) => _['size']),
          Stop(),
        ], [
          Forward((_) => (_['size'] ~/ 3).toDouble()),
          Left((_) => 30.0),
          RunMacro(
            'tree',
                (_) => {'size': ((_['size'] * 2 ~/ 3)).toDouble()},
          ),
          Right((_) => 30.0),
          Forward((_) => (_['size'] ~/ 6).toDouble()),
          Right((_) => 25.0),
          RunMacro(
            'tree',
                (_) => {'size': (_['size'] / 2).toDouble()},
          ),
          Left((_) => 25.0),
          Forward((_) => (_['size'] ~/ 3).toDouble()),
          Right((_) => 25.0),
          RunMacro(
            'tree',
                (_) => {'size': (_['size'] / 2).toDouble()},
          ),
          Left((_) => 25.0),
          Forward((_) => (_['size'] ~/ 6).toDouble()),
          Back((_) => _['size'])
        ])
      ]),
      Back((_) => 250.0),
      PenDown(),
      SetColor((_) => Colors.green),
      RunMacro('tree', (_) => {'size': 280.0}),
      PenUp(),
    ];

    var fernCommands = [
      SetMacro('fern', [
        IfElse((_) => _['size'] < 1.0, [
          Stop()
        ], [
          Forward((_) => _['size']),
          Right((_) => 70.0 * _['sign']),
          RunMacro('fern',
                  (_) => {'size': _['size'] * 0.5, 'sign': _['sign'] * -1}),
          Left((_) => 70.0 * _['sign']),
          Forward((_) => _['size']),
          Left((_) => 70.0 * _['sign']),
          RunMacro(
              'fern', (_) => {'size': _['size'] * 0.5, 'sign': _['sign']}),
          Right((_) => 70.0 * _['sign']),
          Right((_) => 7.0 * _['sign']),
          RunMacro(
              'fern', (_) => {'size': _['size'] - 1.0, 'sign': _['sign']}),
          Left((_) => 7.0 * _['sign']),
          Back((_) => _['size'] * 2.0),
        ])
      ]),

      Back((_) => 250.0),
      Left((_) => 90),
      Forward((_) => MediaQuery.of(context).size.width / 4),
      Right((_) => 90),

      PenDown(),
      RunMacro('fern', (_) => {'size': 25.0, 'sign': 1.0}),
      PenUp(),
    ];

    var dropDown = DropdownButton(
        hint: Text("今晚來點..."),
        value: null,
        items: [
          DropdownMenuItem(child: Text("雪"), value: 0),
          DropdownMenuItem(child: Text("樹"), value: 1),
          DropdownMenuItem(child: Text("蕨"), value: 2),
        ],
        onChanged: (val){
          setState(() {
            switch(val){
              case 0:
                title = "雪";
                currentCommands = snowCommands; break;
              case 1:
                title = "樹";
                currentCommands = treeCommands; break;
              case 2:
                title = "蕨";
                currentCommands = fernCommands; break;
            }
          });
        }
    );

    if (currentCommands.isEmpty){
      currentCommands = snowCommands;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [dropDown],
      ),
      body: AnimatedTurtleView(
        animationDuration: Duration(seconds: 1),
        child: Container(),
        commands: currentCommands),
    );
  }
}