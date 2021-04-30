import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerView extends StatefulWidget {
  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView>
    with SingleTickerProviderStateMixin {
  int saniye1 = 240;

  TimerController _timerController;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: SimpleTimer(
                  duration: Duration(seconds: saniye1),
                  controller: _timerController,
                  timerStyle: _timerStyle,
                  onStart: handleTimerOnStart,
                  onEnd: handleTimerOnEnd,
                  valueListener: timerValueChangeListener,
                  backgroundColor: Colors.grey[400],
                  progressIndicatorColor: Colors.red,
                  progressIndicatorDirection: _progressIndicatorDirection,
                  progressTextCountDirection: _progressTextCountDirection,
                  progressTextStyle: TextStyle(color: Colors.black),
                  strokeWidth: 10,
                ),
              )),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: _timerController.start,
                      child: const Text("Başlat",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.green,
                    ),
                    FlatButton(
                      onPressed: _timerController.pause,
                      child: const Text("Durdur",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                    ),
                    FlatButton(
                      onPressed: _timerController.reset,
                      child: const Text("Sıfırla",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                    FlatButton(
                      onPressed: _timerController.restart,
                      child: const Text("Tekrarla",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.orange,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }

  void _setProgressIndicatorDirection(
      TimerProgressIndicatorDirection progressIndicatorDirection) {
    setState(() {
      _progressIndicatorDirection = progressIndicatorDirection;
    });
  }

  void _setStyle(TimerStyle timerStyle) {
    setState(() {
      _timerStyle = timerStyle;
    });
  }

  void timerValueChangeListener(Duration timeElapsed) {}

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
