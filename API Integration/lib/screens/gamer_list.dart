import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/model.dart';
import 'preview_page.dart';

class GamerList extends StatelessWidget {
  const GamerList({Key? key, required this.gamers}) : super(key: key);
  final List<GamerModel> gamers;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemCount: gamers.length,
        itemBuilder: (context, index) {
          final _data = gamers[index];
          return GamerCard(data: _data);
        });
  }
}

class GamerCard extends StatelessWidget {
  const GamerCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final GamerModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(context,
            CupertinoPageRoute(builder: (context) => PreviewPage(data: data))),

        ///
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Stack(children: [
              /// image
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: double.infinity,
                      child:
                          Image.network(data.thumbnail!, fit: BoxFit.cover))),

              /// info
              SizedBox(
                  height: 200,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title!, style: _style),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price ${data.worth}', style: _style),
                                  Text('Price ${data.type}', style: _style)
                                ])
                          ])))
            ])));
  }
}

const _style = TextStyle(color: Colors.white);
