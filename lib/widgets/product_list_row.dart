import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';


// CARD CLASS i

class ProductListRowWidget extends StatelessWidget{
  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(// card ın her hangibir yerine tıklandığında gitmesi gerek
      child:Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset("assets/ordek.png"),
              height: 120.0,
              width: MediaQuery.of(context).size.width/2,
            ),
            Text(product.productName),
            Text(product.unitPrice.toString()+" TL",style: TextStyle(fontSize: 15,color: Colors.pink),)
          ],
        ),
      ),
    );
  }

}