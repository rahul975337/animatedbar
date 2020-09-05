import 'package:animatedbar/bottomSheet.dart';
import 'package:animatedbar/jobPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'elements/providerMode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          create: (context) => Mode(),
        ),
        
       
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: JobPage()),
    );
  }
}
