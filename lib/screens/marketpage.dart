import 'package:flutter/material.dart';
import 'package:gulio/utilities/constantscolors.dart';
import 'package:gulio/widgets/productcard.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: ConstantsColors().mainColor(),
        elevation: 0,
        title: Center(child: Text('Sokoni')),
      ),
      body: GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
        children: <Widget>[
          ProductCard(
            imageUrl: 'assets/maize.png',
            productlabel: 'Mahindi',
            pricelable: '11000 Tsh/Kg',
          ),
          ProductCard(
            imageUrl: 'assets/beans.png',
            productlabel: 'Mahindi',
            pricelable: '11000 Tsh/Kg',
          ),
          ProductCard(
            imageUrl: 'assets/coffee.jpg',
            productlabel: 'Kahawa',
            pricelable: '11000 Tsh/Kg',
          ),
          ProductCard(
            imageUrl: 'assets/watermelon.png',
            productlabel: 'Mahindi',
            pricelable: '11000 Tsh/Kg',
          ),
          ProductCard(
            imageUrl: 'assets/tomato.png',
            productlabel: 'Mahindi',
            pricelable: '11000 Tsh/Kg',
          ),
        ],
      ),
    );
  }
}
