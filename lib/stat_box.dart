import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatBox extends StatelessWidget {

  final String title;
  final int total;
  final Color backgroundColor;

  const StatBox({this.title, this.total, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###").format(total) ?? "..."}',
              style: TextStyle(fontSize: 48, color: Colors.white),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
