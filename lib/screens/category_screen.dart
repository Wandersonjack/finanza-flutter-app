import 'package:finanza/components/radial_painter.dart';
import 'package:finanza/helpers/color_helper.dart';
import 'package:finanza/models/category_model.dart';
import 'package:finanza/models/expense_model.dart';
import 'package:finanza/utilities/const.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpensesList() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expense) {
      expenseList.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        decoration: kCustomBox,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              expense.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '-\$${(expense.cost).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.red
              ),
            ),
          ],
        ),
      ));
    });
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //progress indicator
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              decoration: kCustomBox,
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey[200],
                  lineColor: getColor(context, percent),
                  percent: percent,
                  width: 15,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpensesList(),
          ],
        ),
      ),
    );
  }
}
