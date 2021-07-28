import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_cart/provider/dark_theme_provider.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return InkWell(
      onTap: null,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Image(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      'Description',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                      top: 2,
                    ),
                    child: Text(
                      '\$Price',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: darkTheme ? Colors.yellow : Colors.purple,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Qunatity',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print('Feeds Items More Button');
                          },
                          child: const Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
