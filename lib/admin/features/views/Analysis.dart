import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Drawer.dart';

class Analysis extends StatefulWidget {
  static const routeName='/analysis';
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Admin Panel" ,style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.w500),),
      ),
      drawer:CustomDrawer(),
      body: Container(
        child: Center(child: Text("Analysis")),
      ),
    );
  }
}
