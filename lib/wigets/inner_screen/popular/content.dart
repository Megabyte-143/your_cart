import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/dark_theme_provider.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return InkWell(
      onTap: null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: darkTheme ? Colors.grey.shade400 : Colors.grey.shade600,
        ),
        constraints: const BoxConstraints(
          minHeight: 150,
          minWidth: double.infinity,
          maxHeight: 200,
        ),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                // margin: EdgeInsets.all(10),
              ),
            ),
            FittedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 10)
                  ],
                  color:
                      darkTheme ? Colors.grey.shade600 : Colors.grey.shade600,
                ),
                padding: const EdgeInsets.fromLTRB(
                  15,
                  15,
                  0,
                  15,
                ),
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        'Title',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: darkTheme ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: 30, top: 30, left: 20),
                      child: Text(
                        '\$Price',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: darkTheme ? Colors.yellow : Colors.purple,
                        ),
                      ),
                    ),
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
