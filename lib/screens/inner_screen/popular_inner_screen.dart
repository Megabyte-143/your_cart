import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/dark_theme_provider.dart';

import '../../wigets/inner_screen/popular/popular_content_builder.dart';
import '../../wigets/inner_screen/popular/navigation_rail_destination.dart';

class PopularBrandInnerScreen extends StatefulWidget {
  const PopularBrandInnerScreen({Key? key}) : super(key: key);
  static const routeName = '/inner-screen';
  @override
  _PopularBrandInnerScreenState createState() => _PopularBrandInnerScreenState();
}

class _PopularBrandInnerScreenState extends State<PopularBrandInnerScreen> {
  int _selectedIndex = 0;
  String brand = '';
  String routeArgs = '';

  List<String> brandName = [
    'Addidas',
    'Apple',
    'Dell',
    'H&M',
    'Nike',
    'Samsung',
    'Huawei',
    'All',
  ];

  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context)!.settings.arguments.toString();

    print(routeArgs);

    _selectedIndex = int.parse(routeArgs.substring(1, 2));
    print(_selectedIndex);

    switch (_selectedIndex) {
      case 0:
        setState(() {
          brand = brandName[0];
        });
        break;
      case 1:
        setState(() {
          brand = brandName[1];
        });
        break;
      case 2:
        setState(() {
          brand = brandName[2];
        });
        break;
      case 3:
        setState(() {
          brand = brandName[3];
        });
        break;
      case 4:
        setState(() {
          brand = brandName[4];
        });
        break;
      case 5:
        setState(() {
          brand = brandName[5];
        });
        break;
      case 6:
        setState(() {
          brand = brandName[6];
        });
        break;
      default:
        setState(() {
          brand = brandName[7];
        });
        break;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      backgroundColor: darkTheme ? Colors.white60 : Colors.grey,
      body: Row(
        children: <Widget>[
          LayoutBuilder(builder: (ctx, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    destinations: [
                      destination(brandName[0]),
                      destination(brandName[1]),
                      destination(brandName[2]),
                      destination(brandName[3]),
                      destination(brandName[4]),
                      destination(brandName[5]),
                      destination(brandName[6]),
                      destination(brandName[7]),
                    ],
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _selectedIndex = index;
                        switch (_selectedIndex) {
                          case 0:
                            setState(() {
                              brand = brandName[0];
                            });
                            break;
                          case 1:
                            setState(() {
                              brand = brandName[1];
                            });
                            break;
                          case 2:
                            setState(() {
                              brand = brandName[2];
                            });
                            break;
                          case 3:
                            setState(() {
                              brand = brandName[3];
                            });
                            break;
                          case 4:
                            setState(() {
                              brand = brandName[4];
                            });
                            break;
                          case 5:
                            setState(() {
                              brand = brandName[5];
                            });
                            break;
                          case 6:
                            setState(() {
                              brand = brandName[6];
                            });
                            break;
                          default:
                            setState(() {
                              brand = brandName[7];
                            });
                            break;
                        }
                      });
                      print(brand);
                    },
                    labelType: NavigationRailLabelType.all,
                    minWidth: 50,
                    leading: Column(
                      children: const <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                "https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg"),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                    selectedLabelTextStyle: TextStyle(
                      color: darkTheme ? Colors.amber : Colors.deepPurple,
                      fontSize: 18,
                    ),
                    unselectedLabelTextStyle: TextStyle(
                      color: darkTheme ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                    groupAlignment: -1,
                    backgroundColor:
                        darkTheme ? Colors.grey.shade800 : Colors.grey.shade600,
                  ),
                ),
              ),
            );
          }),
          ContentBuilder(context, brand),
        ],
      ),
    );
  }
}
