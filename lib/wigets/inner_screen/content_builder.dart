import 'package:flutter/material.dart';

import 'content.dart';

class ContentBuilder extends StatelessWidget {
  //const ContentBuilder({ Key? key }) : super(key: key);
  BuildContext ctx;
  String brand;
  ContentBuilder(this.ctx, this.brand);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(2, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeLeft: true,
          context: context,
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return Content();
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
