import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final IconData iconData;
  final String title;

  CardCategory({this.iconData, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink[50],
            ),
            child: IconButton(
              icon: Icon(
                iconData,
                size: 30,
                color: Colors.pink[400],
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}

/*


Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.pink[50],
        ),
        height: 80,
      //  width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            data["icon"],
            SizedBox(height: 10),
            Text(data["title"]),
          ],
        ),
      ),

      */
