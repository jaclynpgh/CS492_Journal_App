import 'package:flutter/material.dart';



class DetailDisplay extends StatelessWidget {
  final entry;
  const DetailDisplay({Key? key, this.entry}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300.0, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(entry.title, style: Theme.of(context).textTheme.headline5),
          ),
          Text(entry.body,style: Theme.of(context).textTheme.subtitle1),
          Text('Rating: ${entry.rating.toString()}',  style: Theme.of(context).textTheme.subtitle2)
        ],
      ),
    );
  }

}
