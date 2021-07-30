import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

import '../../../provider/product_list_provider.dart';

import 'popular_content.dart';

class ContentBuilder extends StatelessWidget {
  //const ContentBuilder({ Key? key }) : super(key: key);
  const ContentBuilder(this.ctx, this.brand);
  final BuildContext ctx;
  final String brand;

  @override
  Widget build(BuildContext context) {
    final ProductListProvider _brandProducts =
        Provider.of<ProductListProvider>(context);
    final List<Product> brandProducts = _brandProducts.findByBrand(brand);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeLeft: true,
          context: context,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return  Content(brandProducts[index],index);
            },
            itemCount: brandProducts.length,
          ),
        ),
      ),
    );
  }
}
