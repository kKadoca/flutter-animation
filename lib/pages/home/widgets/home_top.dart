import 'package:flutter/material.dart';
import 'package:testing_flutter/pages/home/widgets/category_view.dart';

class HomeTop extends StatelessWidget {

  final Animation<double> containerGrow;

  HomeTop({required this.containerGrow});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Bem-vindo, Kadoquinha!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              height: containerGrow.value * 120,
              width: containerGrow.value * 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/icon.jpg'),
                  fit: BoxFit.cover,
                )
              ),
              child: Container(
                height: containerGrow.value * 35,
                width: containerGrow.value * 35,
                margin: EdgeInsets.only(left: 80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1.0),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: containerGrow.value * 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            CategoryView()
          ],
        ),
      ),
    );
  }
}
