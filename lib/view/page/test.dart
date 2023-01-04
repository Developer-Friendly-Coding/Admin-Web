import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        width: 500,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Colors.amber,
            height: 400,
            width: 800,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: 100,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                    Text('Item $index'),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
