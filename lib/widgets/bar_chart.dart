import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  final List<double> expenses;

  const BarChart({super.key, required this.expenses});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  var currentDate = DateTime.now();
  _getDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 5),
    );
    if (selectedDate != null) {
      currentDate = selectedDate;
    }
  }

  _getPrevDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate.subtract(const Duration(days: 5)),
      lastDate: DateTime(currentDate.year + 5),
    );
    if (selectedDate != null) {
      currentDate = selectedDate;
    }
  }

  _changeDate() {
    setState(() {
      _getDate();
    });
  }

  _changePrevDate() {
    setState(() {
      _getPrevDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (double price in widget.expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              'Weekly Spending',
              style: TextStyle(
                letterSpacing: 1.2,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: IconButton(
                  onPressed: _changePrevDate,
                  iconSize: 24,
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Text(
                '$currentDate',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: _changeDate,
                  iconSize: 24,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: 'Su',
                amountSpent: widget.expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mon',
                amountSpent: widget.expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tue',
                amountSpent: widget.expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Wed',
                amountSpent: widget.expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Thurs',
                amountSpent: widget.expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fri',
                amountSpent: widget.expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sat',
                amountSpent: widget.expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxBarHeight = 150.0;
  const Bar(
      {super.key,
      required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
