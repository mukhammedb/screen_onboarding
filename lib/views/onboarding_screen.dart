import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_screen_/views/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List onBoardingData = [
    {
      'image': 'assets/images/nft1.png',
      "title": 'NFTs - "nonfungible token" ',
      "description": 'деген сөздүн аббревиатурасы'
    },
    {
      'image': 'assets/images/nft2.png',
      "title": 'NFTти кантип жасоо керек?',
      "description":
          'Ачык рыноктук баага ээ боло турган уникалдуу нерсени кантип түзөсүз',
    },
    {
      'image': 'assets/images/nft3.png',
      "title": 'Интернеттин абалына көз салып жатсаңыз',
      "description": 'NFTs жөнүндө бир нерсе уккандырсыз. ',
    }
  ];

  Color whiteColor = Colors.white;
  Color otherColor = const Color(0xff19173D);

  PageController pageController = PageController();

  continueMethod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  int currentPage = 0;

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      backgroundColor: otherColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: continueMethod,
              child: Text(
                'Skip',
                style: TextStyle(color: whiteColor),
              ))
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Image.asset(onBoardingData[index]['image']),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      onBoardingData[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        color: whiteColor,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      onBoardingData[index]['description'],
                      style: TextStyle(
                        fontSize: 18,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (currentPage == (onBoardingData.length - 1))
                    ? ElevatedButton(
                        onPressed: continueMethod,
                        child: const Text('КИРИШҮҮ'),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          onBoardingData.length,
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              height: 10,
                              width: (index == currentPage) ? 15 : 10,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == currentPage)
                                      ? Colors.deepOrange
                                      : Colors.grey),
                            );
                          },
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
