import 'package:flutter/material.dart';

import 'detail.dart';
void main() {
  const PrimaryColor = const Color(0xff800000);
  
  runApp(MaterialApp(
    title: 'Eat Dimsum',
    theme: ThemeData(
      primaryColor: PrimaryColor,
    ),
    home: MyApp(),
  ));
}

class EatDimsum {
  final int id;
  final String name;
  final String location;
  final String description;
  final String imglink;
  const EatDimsum(
      {this.id, this.name, this.location, this.description, this.imglink});
}

List<EatDimsum> data = const <EatDimsum>[
  const EatDimsum(
      id: 1,
      name: 'Wan Ton Goreng',
      location: 'Taiwan',
      description:
          'Kulit pangsit yang diisi dengan daging ayam yang gurih lalu di goreng.',
      imglink:
          'https://img-global.cpcdn.com/recipes/6043a40cef36b77e/680x482cq70/dim-sum-_-wanton-goreng-foto-resep-utama.jpg'),
  const EatDimsum(
      id: 2,
      name: 'Fong Zau',
      location: 'Canton, China Selatan',
      description:
          'Ceker ayam yang dibumbui lalu dikukus sampai empuk dengan cita rasa asam pedas',
      imglink:
          'https://i.pinimg.com/originals/28/b2/5f/28b25f7bbf72b17cd64b41536cdd26b3.jpg'),
  const EatDimsum(
      id: 3,
      name: 'Gao Zi',
      location: 'Asia Barat',
      description:
          'Kulit yang diisi dengan udang giling yang gurih dan disajikan dengan saus vinegar.',
      imglink:
          'https://lifeisshorteatsweet.files.wordpress.com/2014/04/dsc00898es.jpg'),
  const EatDimsum(
      id: 4,
      name: 'Hakau',
      location: 'Asia Tengah Cina',
      description:
          'Kulit yang diisi dengan daging udang utuh dan teksturnya kenyal. Best seller.',
      imglink:
          'https://upload.wikimedia.org/wikipedia/commons/9/9c/Shrimp_dumplings.jpg'),
  const EatDimsum(
      id: 5,
      name: 'Siew Mai',
      location: 'Cina Tradisional',
      description:
          'Kulit pangsit yang diisi dengan daging ayam giling serta udang yang rasanya dangat gurih. Recommended.',
      imglink:
          'https://vokalonline.com/asset/foto_berita/siu_mai.jpg'),
];

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final title = "Eat Dimsum";
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            children: List.generate(data.length, (index) {
              return Center(
                child: ListCard(list: data[index], item: data[index]),
              );
            })));
  }
}

class ListCard extends StatelessWidget {
  const ListCard(
      {Key key,
      this.list,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);
  final EatDimsum list;
  final VoidCallback onTap;
  final EatDimsum item;
  final bool selected;
  @override

  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(index: data.indexOf(list))));
      },
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
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  ],
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}