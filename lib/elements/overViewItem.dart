import 'package:flutter/material.dart';

class OverviewItem extends StatefulWidget {
  final curHeight, expandadedHeight;
  final physics;
  final controller;
  const OverviewItem({
    Key key,
    this.curHeight,
    this.expandadedHeight, this.physics, this.controller,
  }) : super(key: key);

  @override
  _OverviewItemState createState() => _OverviewItemState();
}

class _OverviewItemState extends State<OverviewItem> {
  // ScrollController _controller;
  // @override
  // void initState() {
  //   _controller = ScrollController();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    List text = ["UX", "Photoshop"];
    List<Color> color = [Colors.blue[800], Colors.red[800]];
    List width = [50.0, 100.0];
    double _width = MediaQuery.of(context).size.width;
    double _safePaddingTop = MediaQuery.of(context).padding.top;
    double _safePaddingBottom = MediaQuery.of(context).padding.bottom;
    double _height = MediaQuery.of(context).size.height -
        (_safePaddingBottom + _safePaddingTop);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: _width / 1.5,
            margin: EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => KeyWords(
                color: color[index],
                text: text[index],
                width: width[index],
              ),
            ),
          ),
          Container(
            height: _height / 1.65,
            width: _width,
            // color: Colors.amber,
            child: SingleChildScrollView(
              controller: widget.controller,
              physics: widget.physics,
              // widget.curHeight != widget.expandadedHeight
              //     ? NeverScrollableScrollPhysics()
              //     : AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Urgently hiring \n\nWe Urgently Require a Graphic Designer in Pune. \n\nRequired Knowledge :\n\nPhotoshop,Illustrator,Coraldraw,After Effect,Premier Pro, InDesign.\n\nExpected Start Date: 21/8/2020\n\nJob Type:Full-Time, Contract\n\nSalary:Rs9,000.00 - Rs19,000.00 per month\n\nExperience:\n\n\t\t\t\tCSS:1 year (Required)\n\t\t\t\tGraphic Design:1 year (Required)\n\t\t\t\tDigital Marketing:1 year (Required)\n\nEducation:\n\n\t\t\t\tBachelor's (Required)\n\nGraphic Design Competencies:\n\n\t\t\t\tPhotoshop(Required)\n\t\t\t\tIllustrator(Required)\n\t\t\t\tCoral Draw(Required)\n\t\t\t\tGraphic Designing\n\n\nExperience:\n\n\t\t\t\tCSS:1 year (Required)\n\t\t\t\tGraphic Design:1 year (Required)\n\t\t\t\tDigital Marketing:1 year (Required)\n\nEducation:\n\n\t\t\t\tBachelor's (Required)\n\nGraphic Design Competencies:\n\n\t\t\t\tPhotoshop(Required)\n\t\t\t\tIllustrator(Required)\n\t\t\t\tCoral Draw(Required)\n\t\t\t\tGraphic Designing",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class KeyWords extends StatelessWidget {
  final String text;
  final Color color;
  final width;
  const KeyWords({Key key, this.text, this.color, this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      margin: EdgeInsets.only(right: 20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
