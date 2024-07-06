import 'package:flutter/material.dart';
import 'package:newsapp/screen/newsdetails_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NewsDetailsScreen(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sunil Chhetri’s last dance: Sachin Tendulkar, Rishabh Pant send special wishes",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
