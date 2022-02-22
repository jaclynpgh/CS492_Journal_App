import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project4_journal/widgets/journal_scaffold.dart';
import '/models/journal_entry.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entry = ModalRoute.of(context)!.settings.arguments  as JournalEntry;
    final format = DateFormat('MMMM d, y');

    return JournalScaffold(
        title: format.format(entry.date),
        leading: const BackButton(),
         body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(entry.title, style: Theme.of(context).textTheme.headline6 ), 

          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 2.0),
            child: Text(entry.body,style: Theme.of(context).textTheme.subtitle1),
          ),
          Text('Rating: ${entry.rating.toString()}', style: Theme.of(context).textTheme.subtitle2)],),
      )
    );

    }
  }












