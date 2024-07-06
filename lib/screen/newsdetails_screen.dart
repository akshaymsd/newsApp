import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              pinned: true, // Keeps the app bar visible at all times
              flexibleSpace: FlexibleSpaceBar(
                title: Text('News Details'),
                background: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30.0), // Adjust as needed
                  ),
                  child: Image.asset(
                    'assets/img/chatteri (1).jpg', // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crypto investors should be prepared to lose all their money, BOB governor says',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'by Ryan Browne',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat quam nec lacinia sagittis. Nullam nec velit non ex ultrices egestas. Mauris et varius nulla. Nam et leo vel leo bibendum semper. Donec lobortis quis enim eu ultricies. Integer ac eros risus. Vivamus commodo dui id risus vulputate, ac congue justo suscipit. Suspendisse potenti. Duis lobortis tempor risus ac sollicitudin. Suspendisse potenti. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras in tincidunt nunc. Pellentesque id tortor sapien. Sed eu ante ligula. Ut consectetur augue eget elit posuere, at dapibus magna sodales. Vestibulum mollis justo sit amet nisl posuere tempus. Nam bibendum scelerisque lacus, vitae fermentum leo finibus nec.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
