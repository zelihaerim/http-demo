import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/Widgets/product_list_widget.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/data/api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = List<Category>();
  List<Widget> categoryWidgets = List<Widget>();
  List<Product> products=List<Product>();
  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    // api den oncelikle category listesini doldurmaya calisacagim
    CategoryApi.getCategories().then((response) {
      // data degistiginde bunun ekrana yansiyabilmesi icin setState kullaniriz
      setState(() {
        Iterable list = json.decode(response.body);
        //data'nin body'sini map e donusturecek
        this.categories =
            list.map((category) => Category.fromJson(category)).toList();
        //  her bir elemana category diye takma ad verdik,
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      onPressed: (){
        getProductsByCategoryId(category);
      },
      child: Text(category.categoryName,style: TextStyle(color: Colors.blueGrey),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
          // ne kadar oval olacaginin degeri
        side: BorderSide(color: Colors.amberAccent)
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response){
      // String olarak geliyor onu json haline getir
      setState(() {
        Iterable myjsonlist =json.decode(response.body);//json formatına decode ettik
        this.products=myjsonlist.map((productjson)=>Product.fromJson(productjson)).toList();
        // json da bir map turudur sanirim inheritance iliskisi var
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((response){
      // String olarak geliyor onu json haline getir
      setState(() {
        Iterable myjsonlist =json.decode(response.body);//json formatına decode ettik
        this.products=myjsonlist.map((productjson)=>Product.fromJson(productjson)).toList();
        // json da bir map turudur sanirim inheritance iliskisi var
      });
    });
  }


}
