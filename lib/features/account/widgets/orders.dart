import 'package:flutter/material.dart';
import 'package:tessprojek/constans/global_variable.dart';
import 'package:tessprojek/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://cfx-wp-images.imgix.net/2020/04/2020-Subaru-WRX.jpg?auto=compress%2Cformat&ixlib=php-3.3.0&s=19e013ca77579f4983447a45e1747b67',
    'https://cfx-wp-images.imgix.net/2020/04/2020-Subaru-WRX.jpg?auto=compress%2Cformat&ixlib=php-3.3.0&s=19e013ca77579f4983447a45e1747b67',
    'https://cfx-wp-images.imgix.net/2020/04/2020-Subaru-WRX.jpg?auto=compress%2Cformat&ixlib=php-3.3.0&s=19e013ca77579f4983447a45e1747b67',
    'https://cfx-wp-images.imgix.net/2020/04/2020-Subaru-WRX.jpg?auto=compress%2Cformat&ixlib=php-3.3.0&s=19e013ca77579f4983447a45e1747b67',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                    fontSize: 14,
                    color: GlobalVariables.selectedNavBarColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  image: list[index],
                );
              }),
        ),
      ],
    );
  }
}
