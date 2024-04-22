import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;

  StaggerAnimation({required this.controller}) :
      buttonSqueeze = Tween(
        begin: 320.0,
        end: 60.0
      ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.15)
        )
      ),
      buttonZoomOut = Tween(
          begin: 60.0,
          end: 1000.0,

      ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(0.5, 1.0,
                  curve: Curves.bounceOut
              )
          )
      );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: (){
          controller.forward();
        },
        child: Hero(
          tag: 'fade',
          child: buttonZoomOut.value == 60 ?
          Container(
              height: 60,
              width: buttonSqueeze.value,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(230, 230, 230, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
              ),
              child: _buildInside(context)
          ) :
          Container(
            height: buttonZoomOut.value,
            width: buttonZoomOut.value,
            decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 1.0),
                shape: buttonZoomOut.value < 600 ?
                BoxShape.circle : BoxShape.rectangle
            ),
          ),
        )
      )
    );
  }

  Widget _buildInside(BuildContext context) {
    if(buttonSqueeze.value > 75){
      return Text(
        'Sign in',
        style: TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: _buildAnimation,
        animation: controller,
    );
  }
}
