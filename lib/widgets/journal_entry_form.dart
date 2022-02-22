import 'package:flutter/material.dart';
import 'package:project4_journal/screens/journal_entries_list.dart';
import 'dropdown_rating_down_field.dart';
import '/db/journal_entry_dto.dart';
import '/db/database_manager.dart';


class JournalEntryForm extends StatefulWidget {
  const JournalEntryForm({Key? key}) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  
  final formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: padding(context), left: padding(context), bottom: 10),
              child: titleFormField('Title'),
            ),
               
               Padding(
                 padding: EdgeInsets.only(right: padding(context), left: padding(context), bottom: 10),
                 child: bodyFormField('Body'),
               ),
               
                  Padding(
                    padding: EdgeInsets.only(right: padding(context), left: padding(context), bottom: 10),
                    child: DropdownRatingFormField(
                      maxRating: 4, 
                      onSaved: (value){
                        journalEntryValues.rating = value;
                      },
                      validator:(value) 
                      { if (value == null) 
                      {return "Please enter a rating";
                      } else {
                         return null;
                         } 
                      }),), 
                    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(  //cancel button 
                    onPressed: () {
                          Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  saveButton(context)
                ],) ],
        ),
      ),
    );
  }

  double padding (BuildContext context) {
  if(MediaQuery.of(context).orientation == Orientation.landscape) {
    return   30.0;
  } else {
    return 0.0;
  }
  }

 TextFormField bodyFormField(String fieldTitle) {
    
    return TextFormField(
            autofocus: true,
            decoration:  InputDecoration(
              labelText: fieldTitle, border: const OutlineInputBorder()
             ),
             onSaved: (value){
               
                  journalEntryValues.body = value!;
             },
             validator: (value) {
                if (value!.isEmpty){
                    return "Please enter a title";
                } else{
                  return null;
                }
              },
             );
  }


  TextFormField titleFormField(fieldTitle) {
    
    return TextFormField(
            autofocus: true,
            decoration:  InputDecoration(
              labelText: fieldTitle, border: const OutlineInputBorder()
             ),
             onSaved: (value){
               
                  journalEntryValues.title = value!;
             },
             validator: (value) {
                if (value!.isEmpty){
                    return "Please enter a title";
                } else{
                  return null;
                }
              },
             );
  }

Widget saveButton(BuildContext context){
   return ElevatedButton(
                    onPressed: () async {  // *****TO DO: save to database ****************
                      if (formKey.currentState!.validate()){ 
                          formKey.currentState!.save();
                         addDateToJournalEntryValues();
                         final databaseManager = DatabaseManager.getInstance();
                          databaseManager.saveJournalEntry(dto: journalEntryValues);
                            Navigator.of(context).pushNamed(JournalEntriesScreen.routeName);
                     } 
                    },
                    child: const Text('Save'),
                  );
} 

 void addDateToJournalEntryValues() {
    journalEntryValues.date =  DateTime.now();
  }
}



