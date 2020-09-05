// import 'package:citoto_d2/Screens/alumni/jobsAlumni/bottomOptions.dart';
// import 'package:citoto_d2/Screens/alumni/jobsAlumni/bottomSheet.dart';

import 'package:flutter/material.dart';

import 'bottomSheet.dart';
import 'elements/providerMode.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  Mode mode = Mode();

  Color _color1st,
      _color2nd,
      _colorHighlight,
      _colorLogo,
      _colorText,
      _colorShadow;
  final Duration _duration = Duration(milliseconds: 150);
  final Radius radius = Radius.circular(30.0);

  double _safePaddingTop, _safePaddingBottom, _height, _width;

  @override
  Widget build(BuildContext context) {
    _safePaddingTop = MediaQuery.of(context).padding.top;
    _safePaddingBottom = MediaQuery.of(context).padding.bottom;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height -
        (_safePaddingBottom + _safePaddingTop);

    if (mode.mode) {
      // for professional
      _color1st = Colors.red;
      _color2nd = Colors.blue;
      _colorHighlight = Colors.red;
      _colorLogo =Colors.blue;
      _colorText = Colors.blue;
      _colorShadow = Colors.blue;
    } else {
      // for social
      
    }
    return Scaffold(
      backgroundColor: _color2nd,
      body: Stack(
        children: [
          Positioned(
            top: _safePaddingTop+_height/10,
            left: _width / 10,
            child: Container(
              // color: Colors.amber,
              height: _height / 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: _height / 100),
                    child: Text(
                      "Infosys",
                      style: TextStyle(
                          color: _colorHighlight,
                          fontSize: _height / 40,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                                                  child: Container(
                            margin: EdgeInsets.only(right: _height / 70,top: 3),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: _colorText,
                              size: 16,
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.amber,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: _height / 100),
                                child: Text(
                                  "Graphic Designer",
                                  style: TextStyle(
                                      color: _colorText,
                                      fontSize: _height / 34,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: _height / 100),
                                child: Text("Rs 20K/ Month",
                                    style: TextStyle(
                                      color: _colorText,
                                      fontSize: _height/50,
                                      fontWeight: FontWeight.w600
                                    )),
                              ),
                              Container(
                                // margin: EdgeInsets.only(bottom: _height/100),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Icon(
                                        Icons.location_on,
                                        color: _colorShadow,
                                      ),
                                    ),
                                    Container(
                                      child: Text("Virar (W), Mumbai",
                                          style: TextStyle(
                                            color: _colorShadow,
                                            fontSize: _height/50,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: _safePaddingTop+_height/80,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: _width / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "citoto",
                    style: TextStyle(
                      color: _colorLogo,
                      fontSize: _width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.ac_unit,
                                        color: _colorLogo,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              JobsBottomSheet(
                                color1st: _color1st,
                                color2nd: _color2nd,
                                colorHightlight: _colorHighlight,
                                colorText: _colorText,
                                height: _height,
                                safepaddingbottom: _safePaddingBottom,
                                safepaddingtop: _safePaddingTop,
                                width: _width,
                              ),
                              Positioned(
                                  bottom: 0,
                                  child: Container(
                                    color: _color1st,
                                    child: Container(
                                      margin: EdgeInsets.only(top:10,bottom:10),
                                      width: _width,
                                      alignment: Alignment.center,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                         
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Your contact information is not shared",
                                              style: TextStyle(color: _colorShadow, fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      }
                    }
                    
                    class Feather {
}
