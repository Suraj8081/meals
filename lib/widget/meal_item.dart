import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onTapMeal});

  final Meal meal;
  final Function(Meal meal) onTapMeal;

  String get complexitytext {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilitytext {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onTapMeal(meal);
        },
        child: Stack(children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
              color: Colors.black54,
              child: Column(
                children: [
                  Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(
                        icon: Icons.schedule,
                        lable: '${meal.duration} min',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MealItemTrait(
                        icon: Icons.work,
                        lable: complexitytext,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      MealItemTrait(
                        icon: Icons.attach_money,
                        lable: affordabilitytext,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
