import 'package:flutter/material.dart';

import 'main.dart';

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({Key key, this.index}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Center(
      child: DetailPageCard(list: data[index]),
    );
  }
}

class DetailPageCard extends StatelessWidget {
  const DetailPageCard({Key key, this.list}) : super(key: key);
  final EatDimsum list;
  @override

  Widget build(BuildContext context) {
    final title = "Detail Kuliner";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: new Container(
        child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new Container(
                    padding: const EdgeInsets.all(0),
                    child: Image.network(list.imglink)),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list.name,
                          style: Theme.of(context).textTheme.title),
                      Text(list.location,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                      Text(list.description),
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
      ),
    );
  }
}
