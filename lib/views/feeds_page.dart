import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/PMController.dart';

import 'CupertinoApps.dart';
import 'product/product_create.dart';

class FeedsPage extends StatefulWidget {

  final PMController pmController ;

  const FeedsPage({Key? key, required this.pmController}):super(key: key);

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Product List',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context){
                  // return ProductCreate(pmController: widget.pmController);
                // }));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(CupertinoIcons.add),
              ),
            ),

          ],
        ),
      ),
      child:
       ListView.builder(itemBuilder: (context,index){
      final Product p = widget.pmController.productList[index];
      return GestureDetector(
        onTap: (){
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Expanded( flex: 1,
              //   child: Image.file(p.image, width: 100,height: 50,),
              // ),
              Expanded(flex:2, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(p.name.toString(), style: const TextStyle(fontSize: 25),),
                    const SizedBox(height: 10,),
                    Text(p.price.toString())
                  ],
                ),
              ), )
            ],
          ),
        ),
      );
    },
    itemCount: widget.pmController.productList.length,

    )



      // Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       'Feeds Page',
      //       style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      //     ),
      //     const SizedBox(
      //       height: 8,
      //     ),
      //     _selectFeeds(context)
      //   ],
      // )),
    );
  }

  CupertinoButton _selectFeeds(BuildContext context) {
    return CupertinoButton.filled(
        child: Text('Select Category'),
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  title: Text('Select Categories'),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CategoryPage(
                                    selectedCategory: 'Technology')));
                      },
                      child: Text('Technology'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CategoryPage(
                                    selectedCategory: 'Business')));
                      },
                      child: Text('Business'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    CategoryPage(selectedCategory: 'Sport')));
                      },
                      child: Text('Sport'),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                );
              });
        });
  }
}

class CategoryPage extends StatelessWidget {
  final String selectedCategory;

  CategoryPage({required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('$selectedCategory Page'),
        ),
        child: Center(
          child: Text(
            '$selectedCategory Page',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ));
  }
}
