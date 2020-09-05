import 'package:flutter/material.dart';

class LocationItem extends StatefulWidget {
  @override
  _LocationItemState createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          //MAP
          Container(
            height: _width / 1.2,
            width: _width / 1.2,
            decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.center,
            child: Text("MAP"),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              "Ishdaan Atoli Nandbhat, Church RoadVirar, Mumbai -401303",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
