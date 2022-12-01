import 'package:flutter/material.dart';
import 'package:frontend/models/categoryModel.dart';
import 'package:frontend/services/remoteCategoryServices.dart';
import 'package:frontend/widgets/bottomNavigationWidget.dart';
import 'package:frontend/widgets/categoryTileWidget.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("categories"),
        ),
        bottomNavigationBar: CustomNavigationBar(active: "category"),
        body: CategoryBody());
  }
}

class CategoryBody extends StatefulWidget {
  CategoryBody({Key? key}) : super(key: key);

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  List<CategoryModel>? categories;
  bool isCategoryLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
    isCategoryLoaded = true;
    setState(() {});
  }

  void getCategories() async {
    categories = await RemoteCategoryService().getCategories();
    isCategoryLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: isCategoryLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView(
          children: [
            if (categories != null)
              for (CategoryModel category in categories!)
                CategoryTile(category: category)
          ],
        ),
      ),
    );
  }
}
