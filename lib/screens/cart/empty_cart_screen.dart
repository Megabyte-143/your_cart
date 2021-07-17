import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constant/colors.dart';

import '/provider/dark_theme_provider.dart';

class EmptyCartScreen extends StatelessWidget {
  //const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image(
            image: AssetImage('assets/images/emptycart.png'),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          'Your Cart Is Empty',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Add Some Items',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: themeChange.darkTheme
                ? Theme.of(context).disabledColor
                : ColorsConsts.subTitle,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: RaisedButton(
            child: Text(
              'Shop Now',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: null,
            color: ColorsConsts.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
