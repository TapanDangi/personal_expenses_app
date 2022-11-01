import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key key,
    this.label,
    this.spentAmount,
    this.spentPercentage,
  }) : super(key: key);

  final String label;
  final double spentAmount;
  final double spentPercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18,
          child: FittedBox(
            child: Text('Rs ${spentAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spentPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
