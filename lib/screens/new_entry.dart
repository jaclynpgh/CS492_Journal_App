import 'package:flutter/material.dart';
import '/widgets/journal_entry_form.dart';
import '/widgets/journal_scaffold.dart';


class NewEntry extends StatelessWidget {
  const NewEntry({ Key? key }) : super(key: key);

  static const routeName = '/newEntry';

  @override
  Widget build(BuildContext context) {
    return const JournalScaffold(
      leading: BackButton(),
      title: 'New Entry',
      body: JournalEntryForm(),
      
    );

  }
}