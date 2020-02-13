import 'package:finanza/utilities/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            expandedHeight: 100,
            leading: IconButton(
              icon: Icon(Icons.apps),
              onPressed: (){},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Finanza'),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: (){},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    color: kPrimaryColor,
                  );
                },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
