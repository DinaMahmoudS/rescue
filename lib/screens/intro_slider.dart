import 'package:flutter/material.dart';

import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:rescue2/screens/user_signup/signup.dart';

class IntroSliderPage extends StatefulWidget {
   IntroSliderPage({Key? key}) : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      Slide(
        title: "On Road Services",
        description:
            "The easiest way to order food from your favorite restaurant!",
        pathImage: "assets/images/tow-truck.png",
      ),
    );
    slides.add(
      Slide(
        title: "Track Your Car Maintenance ",
        description: "Book movie tickets for your family and friends!",
        pathImage: "assets/images/automotive.png",
      ),
    );
    slides.add(
      Slide(
        title: "Safety Guaranteed",
        description: "Best discounts on every single service we offer!",
        pathImage: "assets/images/protection.png",
      ),
    );
    slides.add(
      Slide(
        title: "Emergency Precautions Included",
        description: "Book tickets of any transportation and travel the world!",
        pathImage: "assets/images/life-insurance.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
       Slide currentSlide = slides[i];
      tabs.add(
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),

                  child: Image.asset(
                    currentSlide.pathImage!,
                    matchTextDirection: true,
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title!,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.white,
      renderSkipBtn: const Text("Skip"),
      renderNextBtn: const Text(
        "Next",

      ),
      renderDoneBtn: const Text(
        "Done",

      ),

      colorActiveDot: Colors.black,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),

      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Signup(),
        ),
      ),
    );
  }
}
