import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

class BottomSheet extends StatelessWidget {
  //const BottomSheet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeChange.darkTheme ? Colors.grey : Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: themeChange.darkTheme
                      ? [
                          Colors.white70,
                          Colors.yellow,
                        ]
                      : [Colors.white38, Colors.purpleAccent],
                  stops: const [0, 0.9],
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: null,
                  splashColor: Theme.of(context).splashColor,
                  borderRadius: BorderRadius.circular(32),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Checkout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            themeChange.darkTheme ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            "Total Price: ",
            style: TextStyle(
                color: themeChange.darkTheme ? Colors.black : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "56789",
            style: TextStyle(
              color: themeChange.darkTheme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
