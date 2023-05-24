

import 'package:flutter/cupertino.dart';
import 'package:fundamental/views/search_page.dart';
import 'package:fundamental/views/setting_page.dart';


import '../controllers/PMController.dart';
import 'feeds_page.dart';

class CupertinoApps extends StatelessWidget {

  final PMController pmController;

  const CupertinoApps({Key? key, required this.pmController}): super (key:key);
  @override
  Widget build(BuildContext context) {
   return CupertinoTabScaffold(
       tabBar: CupertinoTabBar(items: const [
         BottomNavigationBarItem(
             icon: Icon(CupertinoIcons.news),
         label: 'Feeds'
         ),
         BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),
           label: 'Search',
         ),
         BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),
           label: 'Settings',
         ),

       ],),
       tabBuilder: (context, index){
          switch (index) {
            case 0:
              return FeedsPage(pmController: pmController,);
            case 1:
                return SearchPage();
            case 2 :
              return SettingsPage();
            default:
              return const Center(
                child: Text('Page not Found'),
              );
          }
       }
   );
  }

}




