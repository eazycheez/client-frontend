import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/orderModel.dart';
import 'package:frontend/models/itemModel.dart';
import 'package:frontend/widgets/bottomNavigationWidget.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        bottomNavigationBar: CustomNavigationBar(active: "cart"),
        body: CartBody());
  }
}

class CartBody extends StatefulWidget {
  CartBody({Key? key}) : super(key: key);

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  bool isItemLoaded = false;
  List<Item>? cartItems;
  int totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getTotalPrice() {
    for (Item i in cartItems!) totalPrice += i.price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView(children: [AddMoreNav(), orderBar(total: totalPrice)]),
      ),
    );
  }
}

class AddMoreNav extends StatelessWidget {
  const AddMoreNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(children: [
        Text("Add more items into cart"),
        Icon(Icons.arrow_right)
      ]),
      color: Color(0xA3C834).withOpacity(0.4),
    );
  }
}

class orderBar extends StatelessWidget {
  const orderBar({Key? key, required this.total}) : super(key: key);
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "$total",
                style: TextStyle(fontSize: 32),
              ),
              Text("total price",
                  style: TextStyle(fontSize: 14, color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}
