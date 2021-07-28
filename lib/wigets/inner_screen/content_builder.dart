import 'package:flutter/material.dart';

import 'content.dart';

class ContentBuilder extends StatelessWidget {
  //const ContentBuilder({ Key? key }) : super(key: key);
  const ContentBuilder(this.ctx, this.brand);
  final BuildContext ctx;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeLeft: true,
          context: context,
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return const Content();
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
