import 'package:flutter/material.dart';

class ResponsibilitiesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      // color: Colors.red,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "1. Draft mockups of wbsite designs, brochures, iconography, and any other marketing materials required.\n\n2. Collaborate with marketing teams and management to discuss which mockups are effective, and use their feedback to develop final drafts.\n\n3. Revise the work of previous designers to create a unified aesthetic for our brand materials.\n\n4. Work on multiple projects at once, and consistently meet draft deadlines.\n\n5. Communicate frequently with clients to update them on the progress of the projects and to answer any questions hey might have.",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
