import 'package:flutter/material.dart';
import 'package:flutter_ui_furniture/PageIndicator.dart';
import 'package:flutter_ui_furniture/data.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  AnimationController _controller;
  Animation<double> _titleAnim;
  Animation<double> _tagAnim;
  Animation<double> _priceAnim;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _titleAnim = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(curve: Interval(0, 0.3), parent: _controller));
    _tagAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Interval(0.3, 0.5), parent: _controller));
    _priceAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Interval(0.5, 0.8), parent: _controller));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  void _nextImage() {
    setState(() {
      if (currentIndex < productImage.length - 1) {
        currentIndex++;
        _controller.reset();
        _controller.forward();
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _prevImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        _controller.reset();
        _controller.forward();
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
                  height: 500,
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        top: 120.0,
                        left: 35.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0.0, 30 * (1 - _titleAnim.value)),
                              child: Opacity(
                                opacity: _titleAnim.value,
                                child: Text(
                                  title[currentIndex],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "Montserrat-Bold",
                                    color: Color(0xffF8A734),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Transform.translate(
                              offset: Offset(0.0, 30 * (1 - _tagAnim.value)),
                              child: Opacity(
                                opacity: _tagAnim.value,
                                child: Text(
                                  "NEW SELL",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xffAA3F64),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Transform.translate(
                              offset: Offset(0.0, 30 * (1 - _priceAnim.value)),
                              child: Opacity(
                                opacity: _priceAnim.value,
                                child: Text(
                                  price[currentIndex] + "\$",
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontFamily: "Montserrat-Bold",
                                    color: Color(0xffF65A02),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            SizedBox(
                              width: 70.0,
                              child: PageIndicator(
                                  currentIndex, productImage.length),
                            )
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) {
                            if (details.velocity.pixelsPerSecond.dx > 0) {
                              _prevImage();
                            } else if (details.velocity.pixelsPerSecond.dx <
                                0) {
                              _nextImage();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Wooden ArmChairs",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Montserrat-Bold",
                      ),
                    ),
                    Text(
                      "Anim consectetur enim sunt aliquip labore voluptate excepteur "
                      "laboris et labore adipisicing.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
              child: SizedBox(
                width: 160.0,
                height: 60.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Color(0xfffa7b58),
                        child: Center(
                          child: Icon(Icons.favorite_border, color: Colors.white,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xff2a2d3f),
                        child: Center(
                          child: Icon(Icons.shopping_basket, color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
