import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:task1/ApiService.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final carrouselProvider = Provider.of<CarrouselProvider>(context);

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF08092D),
      body: FutureBuilder(
        future: Future.wait([
          carrouselProvider.fetchCarrouselImages(),
          carrouselProvider.fetchBreathworkImages(),
          carrouselProvider.fetchTrendingBreathworkImages()
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: screenWidth * 0.95,
                    height: screenWidth * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 6, 53, 53),
                    ),
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: screenWidth * 0.55,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            pauseAutoPlayOnTouch: true, enlargeCenterPage: true,
                            viewportFraction:
                                1.0, // Set to 1.0 for one item at a time
                          ),
                          items: carrouselProvider.carrouselImages
                              .map((String url) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: screenWidth,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(url),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Positioned(
                          bottom: screenWidth * 0.05,
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'My Prayers.Club',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Center(
                                child: Text(
                                  'Create a AI generated personalized  Breathing Excercise videos as per your feeling ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.03),
                              SizedBox(
                                width: screenWidth * 0.55,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF77CDB3),
                                    onPrimary: Color(0xFF77CDB3),
                                    side: const BorderSide(
                                      color: Color(0xFF77CDB3),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'CREATE YOUR VIDEO',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Trending Breath Work",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 0.45, // Adjust the height as needed
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: carrouselProvider.breathworkImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth *
                                          0.4, // Adjust the width as needed
                                      // height:
                                      //     screenWidth * 0.45, // Adjust the height as needed
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(255, 6, 53, 53)),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Stack(children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.network(
                                                carrouselProvider
                                                        .breathworkImages[index]
                                                    ["url"]!,
                                                width: screenWidth * 0.4,
                                                height: screenWidth * 0.25,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 15,
                                              left: 0,
                                              right: 0,
                                              child: Center(
                                                child: Container(
                                                  height: 40,
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                  ),
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      // size: 12,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Text(
                                                  '${carrouselProvider.breathworkImages[index]["timing"]!}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.4,
                                      child: Text(
                                        carrouselProvider
                                            .breathworkImages[index]["title"]!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Your Breathwork",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenWidth * 0.45,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              carrouselProvider.breathTrendingworkImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth *
                                          0.4, // Adjust the width as needed

                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromARGB(255, 6, 53, 53)),
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Stack(children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.network(
                                                carrouselProvider
                                                        .breathTrendingworkImages[
                                                    index]["url"]!,
                                                width: screenWidth * 0.4,
                                                height: screenWidth * 0.25,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 15,
                                              left: 0,
                                              right: 0,
                                              child: Center(
                                                child: Container(
                                                  height: 40,
                                                  margin: EdgeInsets.only(
                                                      bottom: 10.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                  ),
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      // size: 12,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Text(
                                                  '${carrouselProvider.breathTrendingworkImages[index]["timing"]!}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.4,
                                      child: Text(
                                        carrouselProvider
                                                .breathTrendingworkImages[index]
                                            ["title"]!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenWidth * 0.92,
                    height: screenWidth * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 6, 53, 53),
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://thumbs.dreamstime.com/b/night-sky-stars-milky-way-mountain-background-amazing-50461387.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenWidth * 0.4,
                          child: Text(
                            'You have 1 credit available to create personal video',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF77CDB3),
                            onPrimary: Color(0xFF77CDB3),
                            side: BorderSide(
                              color: Color(0xFF77CDB3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Text(
                                'Create Video',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
