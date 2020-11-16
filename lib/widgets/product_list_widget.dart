import 'package:flutter/cupertino.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_row.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products;

  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  //ustteki sinifin
  // memberlarina ulasabilmek icin parametre olarak verdik
  // memberlar, bir alt sinifa veremeyiz cunku main screen en bastaki
  // classin instance sini olusturuyor.
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    // asagidaki widget State classini temsil eder
    return Column(
      children: [
        SizedBox(height: 10.0,),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }


}
