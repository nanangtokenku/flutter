import 'package:aztira/src/ui/produk/produk1.dart';
import 'package:aztira/src/ui/produk/produk2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  @override
  _Produk createState() => _Produk();
}

class _Produk extends State<Produk> with SingleTickerProviderStateMixin {
  //create controller untuk tabBar
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokenku Katalog'), //bottom
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Prepaid",
              icon: new Icon(Icons.add_photo_alternate_outlined),
            ),
            new Tab(
              text: "Postpaid",
              icon: new Icon(Icons.list),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new Produk1(),
          new Produk2()
        ],
      ),
    );
  }
}
