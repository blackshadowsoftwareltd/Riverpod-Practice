import 'package:flutter/material.dart';

import '../../models/model.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.data}) : super(key: key);
  final GamerModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(data.title!)),
        body: ListView(padding: const EdgeInsets.all(5), children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  width: double.infinity,
                  child: Image.network(data.thumbnail!, fit: BoxFit.cover))),
          Text('\nPrice ${data.worth}'),
          Text('\nType ${data.type}'),
          Text('\nPlatform : ${data.platforms}'),
          Text('\nPublished at ${data.publishedDate}'),
          Text('\nEnd at ${data.endDate}'),
          Text('\nTotal users ${data.users}'),
          Text('\nDescription : \n${data.description}'),
          Text('\nInstructions : \n${data.instructions}')
        ]));
  }
}
