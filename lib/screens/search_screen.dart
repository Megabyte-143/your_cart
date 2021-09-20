import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:your_cart/models/product.dart';
import 'package:your_cart/provider/product_list_provider.dart';
import 'package:your_cart/wigets/feeds_screen/feeds_screen_items.dart';
import 'package:your_cart/wigets/search_screen/search_header.dart';
import 'package:your_cart/wigets/search_screen/search_items.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController = TextEditingController();
  final FocusNode _node = FocusNode();
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _node.dispose();
    _textEditingController.dispose();
  }

  List<Product> _searchList = [];
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductListProvider>(context);
    final List<Product> productList = productData.products;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SearchHeader(
              search: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 10,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Here',
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: _textEditingController.text.isNotEmpty
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: _textEditingController.text.isEmpty
                            ? () {}
                            : () {
                                _textEditingController.clear();
                                _node.unfocus();
                              },
                      ),
                    ),
                    controller: _textEditingController,
                    focusNode: _node,
                    onChanged: (value) {
                      _textEditingController.text.toLowerCase();
                      setState(() {
                        _searchList = productData.findBySearch(value);
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _textEditingController.text.isEmpty && _searchList.isEmpty
                ? StaggeredGridView.countBuilder(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 6,
                    itemCount: productList.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) => Container(
                      child: FeedsScreenItems(index),
                    ),
                    addRepaintBoundaries: true,
                    addAutomaticKeepAlives: true,
                    staggeredTileBuilder: (i) =>
                        StaggeredTile.count(3, i.isEven ? 5.8 : 5.4),
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 6,
                  )
                : _searchList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 50,
                            ),
                            Icon(
                              Icons.search,
                              size: 70,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "NOTHING TO SHOW",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    : StaggeredGridView.countBuilder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 6,
                        itemCount: _searchList.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => Container(
                          child: SearchScreenItems(
                            index,
                            _textEditingController.text.toLowerCase(),
                          ),
                        ),
                        addRepaintBoundaries: true,
                        addAutomaticKeepAlives: true,
                        staggeredTileBuilder: (i) =>
                            StaggeredTile.count(3, i.isEven ? 5.8 : 5.4),
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 6,
                      ),
          ),
        ],
      ),
    );
  }
}
