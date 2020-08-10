import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return Complexity.Simple.toString().split('.')[1];
        break;
      case Complexity.Challenging:
        return Complexity.Challenging.toString().split('.')[1];
        break;
      case Complexity.Hard:
        return Complexity.Hard.toString().split('.')[1];
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return Affordability.Affordable.toString().split('.')[1];
        break;
      case Affordability.Pricey:
        return Affordability.Pricey.toString().split('.')[1];
        break;
      case Affordability.Luxurious:
        return Affordability.Luxurious.toString().split('.')[1];
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300.0,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 26.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text('$complexityText'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6.0),
                      Text('$affordabilityText'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
