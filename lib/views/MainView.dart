

import 'package:flutter/cupertino.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return CupertinoPageScaffold(
       navigationBar: CupertinoNavigationBar(
         middle: Text('Cuppertino App'),
       ),
     child: Center(
       child: Text(
         'Home Page',
         style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
       ),
     ),
   );
  }

}