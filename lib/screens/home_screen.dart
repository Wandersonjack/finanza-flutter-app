import 'package:finanza/components/bar_chart.dart';
import 'package:finanza/data/data.dart';
import 'package:finanza/helpers/color_helper.dart';
import 'package:finanza/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:finanza/models/category_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category, double totalAmountSpent) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                category.name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constrains) {
              final double maxBarWidth = constrains.maxWidth;
              final double percent = (category.maxAmount - totalAmountSpent) /category.maxAmount;
              double barWidth = percent * maxBarWidth;
              if(barWidth < 0){
                barWidth = 0;
              }
              return Stack(
                children: <Widget>[
                  Container(
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200]),
                  ),
                  //BAR WIDTH COMPONENT
                  Container(
                    height: 15,
                    width:barWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: getColor(context, percent),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

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
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Finanza'),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: BarChart(
                      expenses: weeklySpending,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmountSpent = 0;
                  category.expenses.forEach((Expense expense) {
                    totalAmountSpent += expense.cost;
                  });
                  return _buildCategory(category, totalAmountSpent);
                }
              },
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
