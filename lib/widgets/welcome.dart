import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.book,
              size: 120.0,
              color: Colors.purple,
            ),
            Text('Journal', style: Theme.of(context).textTheme.headline6)
          ],
        ),
      );
      

  }
}
