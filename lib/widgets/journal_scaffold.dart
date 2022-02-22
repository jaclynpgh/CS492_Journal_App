import 'package:flutter/material.dart';
import '/screens/new_entry.dart';
import 'drawer.dart';


class JournalScaffold extends StatefulWidget {
final Widget? body;
final String title;
final Widget? leading;
final Widget? button;

const JournalScaffold({ Key? key, this.body, required this.title, this.leading, this.button}) : super(key: key);

  @override
  State<JournalScaffold> createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      endDrawer:  const SettingsDrawer(),
      appBar: AppBar(
        leading: widget.leading,
        title:  Text(widget.title),
        actions: [
            Builder(
              builder: (context) => IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
            ),
          ],
      ),
      body: widget.body,
      floatingActionButton: widget.button, );
  }
}

class AddEntryButton extends StatelessWidget {
  const AddEntryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
      onPressed: () {
            Navigator.pushNamed(context, NewEntry.routeName);
      },
    );
  }
}

