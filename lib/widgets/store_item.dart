import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StoreItem extends StatelessWidget {
  const StoreItem(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.imageUrl});
  final String title;
  final String description;
  final String price;
  final String rating;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(imageUrl),
              ),
              const Gap(20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const Gap(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: getStars(3),
                  ),
                ],
              ),
              const Gap(12),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.redAccent,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                      Gap(5),
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getStars(int rating) {
  return [
    ...List.generate(5, (index) {
      if (index < rating) {
        return const Icon(
          Icons.star,
          size: 20,
          color: Colors.amber,
        );
      } else {
        return const Icon(
          Icons.star_border,
          size: 20,
        );
      }
    })
  ];
}
