import 'package:flutter/material.dart';
import 'package:flutter_ui_furniture/data.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int currentIndex= 0;

  void _nextImage() {
    setState(() {
      if (currentIndex < productImage.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }


  void _prevImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60)),
                  child: SizedBox(
                    height: 490,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          productImage[currentIndex],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 40.0,
                          left: 24.0,
                          child: IconButton(
                            icon: Icon(Icons.keyboard_backspace),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          top: 150.0,
                          left: 35.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title[currentIndex],
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                "NEW SELL",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 40,),
                              Text(
                                price[currentIndex] + "\$",
                                style: TextStyle(fontSize: 35.0),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: GestureDetector(
                            onHorizontalDragEnd: (DragEndDetails details) {
                              if (details.velocity.pixelsPerSecond.dx > 0) {
                                _prevImage();
                              } else if (details.velocity.pixelsPerSecond.dx < 0) {
                                _nextImage();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
