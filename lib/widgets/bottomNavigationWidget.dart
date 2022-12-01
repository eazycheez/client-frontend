import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key, required this.active}) : super(key: key);
  final String active;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        children: [
          Expanded(child: HomeIcon(active: this.active)),
          Expanded(child: CategoryIcon(active: this.active)),
          Expanded(child: CartIcon(active: this.active)),
          Expanded(child: ProfileIcon(active: this.active)),
        ],
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key, required this.active}) : super(key: key);
  final String active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (active != "cart")
          ? Navigator.pushNamedAndRemoveUntil(
              context, '/cart', (route) => false)
          : () => {},
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          (active == "cart")
              ? Icon(
                  Icons.shopping_bag,
                  color: Colors.green,
                )
              : Icon(Icons.shopping_bag_outlined),
          Text(
            "cart",
            style: TextStyle(fontSize: 12),
          )
        ]),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key, required this.active}) : super(key: key);
  final String active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (active != "profile")
          ? Navigator.pushNamedAndRemoveUntil(
              context, '/profile', (route) => false)
          : () => {},
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          (active == "profile")
              ? Icon(
                  Icons.person,
                  color: Colors.green,
                )
              : Icon(Icons.person_outline),
          Text(
            "profile",
            style: TextStyle(fontSize: 12),
          )
        ]),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({Key? key, required this.active}) : super(key: key);
  final String active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (active != "category")
          ? Navigator.pushNamedAndRemoveUntil(
              context, '/category', (route) => false)
          : () => {},
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          (active == "category")
              ? Icon(
                  Icons.category,
                  color: Colors.green,
                )
              : Icon(Icons.category_outlined),
          Text(
            "categories",
            style: TextStyle(fontSize: 12),
          )
        ]),
      ),
    );
  }
}

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key? key, required this.active}) : super(key: key);
  final String active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (active != "home")
          ? Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
          : () => {},
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          (active == "home")
              ? Icon(
                  Icons.home,
                  color: Colors.green,
                )
              : Icon(Icons.home_outlined),
          Text(
            "home",
            style: TextStyle(fontSize: 12),
          )
        ]),
      ),
    );
  }
}
