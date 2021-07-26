import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Models/cart.dart';
import 'dart:convert';
import 'package:flutter_app/Models/catalog.dart';
import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'package:flutter_app/widgets/item_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation , RemoveMutation},
          builder: (context , _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(CupertinoIcons.cart , color: Colors.white,),
            // backgroundColor: MyTheme.darkBluishColor,
            backgroundColor: context.theme.buttonColor,
          ).badge(
              color: Vx.gray200 ,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
          ),
        ),
      /*appBar: AppBar(
        title: Text("Catalog App"),
      ),*/
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(
                    child: CircularProgressIndicator().expand(),
                  )
            ],
          ),
        ),
      ),
    );
  }
}





