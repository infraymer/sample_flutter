import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final String price;
  final String title;
  final String unit;
  final bool isSelected;

  const PriceCard({Key key, this.price, this.title, this.unit, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 76,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Color(0xFFFE5B00) : Color.fromARGB(26, 9, 6, 27),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xfffe5b00),
              ),
            ),
          ),
          SizedBox(height: 7),
          Expanded(
            child: Text('$price ₽ • $unit'),
          ),
        ],
      ),
    );
  }
}
