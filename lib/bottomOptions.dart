import 'package:flutter/material.dart';

Widget titleBoxSocial(
    String type,
    double height,
    double width,
    int _selected,
    Duration _duration,
    Color _color2nd,
    Color _color1st,
    Color _colorHighlight,
    Color _colorText,
    Radius radius) {
  return AnimatedContainer(
    duration: _duration,
    height: 40.0,
    width: width,
    child: Column(
      children: <Widget>[
        ((_selected == 1 && type == 'overview') ||
                (_selected == 2 && type == 'responsibilities') ||
                (_selected == 3 && type == 'location'))
            ? Expanded(
                child: AnimatedContainer(
                  duration: _duration,
                  height: 40.0 * 1 / 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RotatedBox(
                      quarterTurns: -2,
                      child: Text(
                        type[0].toUpperCase() + type.substring(1),
                        softWrap: false,
                        style: TextStyle(
                            color: _colorHighlight,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: width * 0.1),
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
        AnimatedContainer(
          height: individualHeight(type, 40.0, _selected),
          width: width,
          duration: _duration,
          decoration: individualDecoration(type, width, _color2nd, _color1st,
              _colorHighlight, radius, _selected),
          child: ((_selected == 1 && type == 'overview') ||
                  (_selected == 2 && type == 'responsibilities') ||
                  (_selected == 3 && type == 'location'))
              ? SizedBox()
              : Align(
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: -2,
                    child: Text(
                      type[0].toUpperCase() + type.substring(1),
                      softWrap: false,
                      style: TextStyle(
                          color: _colorText,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: width * 0.1),
                    ),
                  ),
                ),
        ),
      ],
    ),
  );
}

double individualHeight(String nowSelected, double _height, int _selected) {
  double _selectedHeight = _height * 1 / 2;
  if ((_selected == 1 && nowSelected == 'overview') ||
      (_selected == 2 && nowSelected == 'responsibilities') ||
      (_selected == 3 && nowSelected == 'location')) {
    return _selectedHeight;
  } else {
    return _height;
  }
}

BoxDecoration individualDecoration(
    String nowSelected,
    double width,
    Color _color,
    Color _colorBack,
    Color _colorHigh,
    Radius _radius,
    int _selected) {
  BorderRadius _leftMost =
      BorderRadius.only(bottomRight: _radius, bottomLeft: _radius);
  BorderRadius _rightMost =
      BorderRadius.only(bottomLeft: _radius, bottomRight: _radius);
  BorderRadius _mid = BorderRadius.vertical(bottom: _radius);
  BorderRadius _leftBuddy = BorderRadius.only(topLeft: _radius);
  BorderRadius _rightBuddy = BorderRadius.only(topRight: _radius);
  double _valueForShadow = width * 0.06 * 1 / 1.2;

  switch (nowSelected) {
    case 'overview':
      switch (_selected) {
        case 1:
          return BoxDecoration(
              color: _colorBack,
              borderRadius: _leftMost,
              boxShadow: [
                BoxShadow(
                    color: _color,
                    spreadRadius: _valueForShadow,
                    offset: Offset(0, _valueForShadow))
              ]);
          break;
        case 2:
          return BoxDecoration(
            color: _color,
            borderRadius: _leftBuddy,
          );
          break;
        case 3:
          return BoxDecoration(
            color: _color,
          );
          break;
      }
      break;
    case 'responsibilities':
      switch (_selected) {
        case 1:
          return BoxDecoration(
            color: _color,
            borderRadius: _rightBuddy,
          );
          break;
        case 2:
          return BoxDecoration(
              color: _colorBack,
              borderRadius: _mid,
              boxShadow: [
                BoxShadow(
                    color: _color,
                    spreadRadius: _valueForShadow,
                    offset: Offset(0, _valueForShadow))
              ]);
          break;
        case 3:
          return BoxDecoration(
            color: _color,
            borderRadius: _leftBuddy,
          );
          break;
      }
      break;
    case 'location':
      switch (_selected) {
        case 2:
          return BoxDecoration(
            color: _color,
            borderRadius: _rightBuddy,
          );
          break;
        case 3:
          return BoxDecoration(
              color: _colorBack,
              borderRadius: _rightMost,
              boxShadow: [
                BoxShadow(
                    color: _color,
                    spreadRadius: _valueForShadow,
                    offset: Offset(0, _valueForShadow))
              ]);
          break;
        case 1:
          return BoxDecoration(
            color: _color,
          );
          break;
      }
      break;
  }
}
