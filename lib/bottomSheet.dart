
import 'package:flutter/material.dart';
import 'bottomOptions.dart';
import 'elements/locationItem.dart';
import 'elements/overViewItem.dart';
import 'elements/providerMode.dart';
import 'elements/responsibilitiesItem.dart';

class JobsBottomSheet extends StatefulWidget {
  final double height, width, safepaddingtop, safepaddingbottom;
  final colorHightlight, colorText, color1st, color2nd;
  const JobsBottomSheet({
    Key key,
    this.height,
    this.width,
    this.safepaddingtop,
    this.safepaddingbottom,
    this.colorHightlight,
    this.colorText,
    this.color1st,
    this.color2nd,
  }) : super(key: key);

  @override
  _JobsBottomSheetSheetState createState() => _JobsBottomSheetSheetState();
}

class _JobsBottomSheetSheetState extends State<JobsBottomSheet> {
  List dummyComments;
  bool startState = true;
  var _startHeight;
  var _startDy;
  var start;
  var end;
  var curHeight;
  var minHeight;
  var expandedHeight;
  Color _color1st, _color2nd, _colorText, _colorHighlight;
  Mode mode = Mode();
  final Duration _duration = Duration(milliseconds: 150);
  final Radius radius = Radius.circular(30.0);
  // ScrollPhysics never = NeverScrollableScrollPhysics();
  // ScrollPhysics always = AlwaysScrollableScrollPhysics();
  ScrollPhysics physics = NeverScrollableScrollPhysics();
  ScrollController _controller;

  _listener() {
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("top:${_controller.offset}");
      setState(() {
        physics = physics == NeverScrollableScrollPhysics()
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics();
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    // _controller.addListener(_scrollListener);
    // _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _color1st = widget.color1st;
    _color2nd = widget.color2nd;
    _colorText = widget.colorText;
    _colorHighlight = widget.colorHightlight;
    var expandedHeight =
        widget.height - widget.safepaddingtop - widget.height / 25;
    final double _height = widget.height;
    final double _width = widget.width;
    if (startState) {
      minHeight = _height / 1.4;
      curHeight = minHeight;
      startState = false;
    }
    return AnimatedPositioned(
      duration: Duration(milliseconds: 150),
      top: _height -
          curHeight +
          widget.safepaddingbottom +
          widget.safepaddingtop,
      child: GestureDetector(
        onTap: () {
          print("tapperd");
        },
        onVerticalDragStart: (s) {
          _startDy = s.globalPosition.dy;
          _startHeight = curHeight;
          setState(() {
            start = _startDy;
          });
        },
        onVerticalDragUpdate: (a) {
          var _currentDy = a.globalPosition.dy;
          var newHeight = _startDy - _currentDy;
          setState(() {
            if ((_startHeight + newHeight) > minHeight &&
                (_startHeight + newHeight) < expandedHeight) {
              // curHeight = 300.0;
              curHeight = (_startHeight + newHeight);
            } else if ((_startHeight + newHeight) == minHeight) {
              curHeight = minHeight;
            } else if ((_startHeight + newHeight) == expandedHeight) {
              curHeight = expandedHeight;
            }
            end = _currentDy;
          });
        },
        onVerticalDragEnd: (c) {
          setState(() {
            if (curHeight > minHeight + 100) {
              curHeight = expandedHeight;
              setState(() {
                physics = AlwaysScrollableScrollPhysics();
              });
            } else {
              curHeight = minHeight;
              mode.comments = false;
            }
          });
        },
        child: Container(
          height: _height / 1.1,
          width: _width,
          decoration: BoxDecoration(
              color:
                  //  Colors.red,
                  _color2nd,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Column(
            children: [
              GestureDetector(
                  // onTap: () {
                  //   if (curHeight <= minHeight) {
                  //     print("pressed");
                  //     setState(() {
                  //       curHeight = expandedHeight;
                  //       // open = true;
                  //     });
                  //   } else {
                  //     setState(() {
                  //       curHeight = minHeight;
                  //       mode.comments = false;
                  //       // open = false;
                  //     });
                  //   }
                  // },
                  onVerticalDragStart: (s) {
                    setState(() {
                      // open = false;
                    });
                    _startDy = s.globalPosition.dy;
                    _startHeight = curHeight;
                  },
                  onVerticalDragUpdate: (a) {
                    var _currentDy = a.globalPosition.dy;
                    var newHeight = _startDy - _currentDy;
                    setState(() {
                      if ((_startHeight + newHeight) > minHeight &&
                          (_startHeight + newHeight) < expandedHeight) {
                        // curHeight = 300.0;
                        curHeight = (_startHeight + newHeight);
                      } else if ((_startHeight + newHeight) == minHeight) {
                        curHeight = minHeight;
                      } else if ((_startHeight + newHeight) == expandedHeight) {
                        curHeight = expandedHeight;
                      }
                    });
                  },
                  onVerticalDragEnd: (c) {
                    setState(() {
                      if (curHeight > minHeight + 100) {
                        curHeight = expandedHeight;
                        // open = true;
                      } else {
                        curHeight = minHeight;
                        mode.comments = false;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: _duration,
                    height: 40,
                    width: _width,
                    color: _color1st,
                    child: _forSocial(_width),
                  )),
              Expanded(
                child: Container(
                    width: _width,
                    decoration: BoxDecoration(
                        color: _color1st,
                        borderRadius: mode.selectedJobs == 2
                            ? BorderRadius.only(
                                topLeft: radius, topRight: radius)
                            : mode.selectedJobs == 1
                                ? BorderRadius.only(topRight: radius)
                                : mode.selectedJobs == 3
                                    ? BorderRadius.only(topLeft: radius)
                                    : null),
                    child: mode.selectedJobs == 1
                        ? OverviewItem(
                            curHeight: curHeight,
                            expandadedHeight: expandedHeight,
                            physics: physics,
                            controller: _controller,
                          )
                        : mode.selectedJobs == 2
                            ? ResponsibilitiesItem()
                            : mode.selectedJobs == 3 ? LocationItem() : null),
              ),
              Container(
                color: _color1st,
                height: _height / 8,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _forSocial(double width) {
    return Container(
      // color: Color(0xFF121212),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                setState(() {
                  mode.selectedJobs = 1;
                  print(mode.selectedJobs);
                });
              },
              child: RotatedBox(
                quarterTurns: -2,
                child: titleBoxSocial(
                    'overview',
                    60.0,
                    width / 3,
                    mode.selectedJobs,
                    _duration,
                    _color2nd,
                    _color1st,
                    _colorHighlight,
                    _colorText,
                    radius),
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  mode.selectedJobs = 2;
                  print(mode.selectedJobs);
                });
              },
              child: RotatedBox(
                quarterTurns: -2,
                child: titleBoxSocial(
                    'responsibilities',
                    60.0,
                    width / 3,
                    mode.selectedJobs,
                    _duration,
                    _color2nd,
                    _color1st,
                    _colorHighlight,
                    _colorText,
                    radius),
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  mode.selectedJobs = 3;
                  print(mode.selectedJobs);
                });
              },
              child: RotatedBox(
                quarterTurns: -2,
                child: titleBoxSocial(
                    'location',
                    60.0,
                    width / 3,
                    mode.selectedJobs,
                    _duration,
                    _color2nd,
                    _color1st,
                    _colorHighlight,
                    _colorText,
                    radius),
              )),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: _color2nd,
                    borderRadius: mode.selectedJobs == 3
                        ? BorderRadius.only(bottomLeft: radius)
                        : null)),
          )
        ],
      ),
    );
  }
}
