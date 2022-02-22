# CS 492 Project 4 Journal

A program that models a journal, enabling users to create journal entries, which have a title, body, date, and rating.

## Description

The program:
1. Displays a "welcome" widget when the application starts and there are no journal entries or displays a list of existing journal entries.
2. Provides the user the option to change the theme from light to dark, and uses the "shared preferences" concept of mobile applications to load and save the theme configuration option, so that the chosen option persists between application restarts.
3. Displays the details of the journal entry, including its title, body, date and numeric rating, when tapped on in the list.
4. Adapts the interface to display the list of journal entries on the left, and the details of the entry on the right (in a "master-detail" layout convention) when the device has a landscape orientation.
5. Displays a FloatingActionButton that, when tapped, displays a form for entering attributes of a new journal entry.
6. Validates the values in the form, ensuring that the title and body are not blank, and that the rating is an integer between 1 and 4.
7. Creates a new journal entry when the form's "Save" button is tapped, and return to the previous screen.
8. Use a sqlite database file to store, retrieve and update the journal entries, so that the data persists between application restarts.

