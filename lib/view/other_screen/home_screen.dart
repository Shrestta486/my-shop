import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


// Assuming these are defined in your utilities files
import '../../utilities/app_color.dart';
import '../../utilities/app_font.dart';
import '../../utilities/app_image.dart';


class Home extends StatefulWidget {
  static String routeName = "./Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController discountCodeController = TextEditingController();
  DateTime? lastPressed;
  int status = 0;
  int selectedCategoryIndex = 0;
   CarouselController carouselController = CarouselController();

  // Sample data - replace with your actual data
  List<Map<String, dynamic>> eventList = [
    {"image": "assets/event1.jpg", "name": "Vibe & Verse"},
    {"image": "assets/event2.jpg", "name": "Music Festival"},
  ];

  List<Map<String, dynamic>> categoriesList = [
    {"image": "assets/category1.jpg", "categoriesType": "Music", "id": 1, "event": "Concert"},
    {"image": "assets/category2.jpg", "categoriesType": "Sports", "id": 2, "event": "Game"},
  ];

  List<Map<String, dynamic>> partiesist = [
    {"image": "assets/party1.jpg", "day": "Today", "name": "Party Night"},
    {"image": "assets/party2.jpg", "day": "Tomorrow", "name": "DJ Night"},
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);
        final isWarning =
            lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Press back again to exit")));
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  
                  // Featured Events Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Featured Events",
                          style: const TextStyle(
                            color: AppColor.secondaryColor,
                            fontFamily: AppFont.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CarouselSlider(
                          carouselController: carouselController,
                          items: eventList.map((event) => GestureDetector(
                            onTap: () {
                             
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.secondaryColor,
                                    blurRadius: 14,
                                    spreadRadius: 0,
                                    offset: Offset.zero,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage(event["image"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "April 08, 2025",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    event["name"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )).toList(),
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            viewportFraction: 0.95,
                            enlargeCenterPage: true,
                            height: MediaQuery.of(context).size.height * 0.38,
                            onPageChanged: (index, reason) {
                              setState(() {
                                status = index;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(eventList.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              height: 4,
                              width: status == index ? 26 : 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: status == index
                                    ? AppColor.secondaryColor
                                    : AppColor.textColor,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Explore Categories Section
                  _buildSectionTitle("ccdkvkd"?? "Explore Categories"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                 
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(categoriesList[index]["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                categoriesList[index]["categoriesType"],
                                style: const TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontFamily: AppFont.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Upcoming Events Section
                  _buildSectionTitle( "Upcoming Events"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: partiesist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.primaryColor.withOpacity(0.25),
                                  offset: const Offset(0, 0),
                                  blurRadius: 4,
                                ),
                              ],
                              gradient: selectedCategoryIndex == index
                                  ? AppColor.borderGradient
                                  : null,
                              color: selectedCategoryIndex == index
                                  ? null
                                  : AppColor.secondaryColor.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              partiesist[index]["day"],
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColor.secondaryColor,
                                fontFamily: AppFont.fontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: partiesist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                           
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.secondaryColor.withOpacity(0.17),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    partiesist[index]["image"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 120,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        partiesist[index]["name"],
                                        style: const TextStyle(
                                          color: AppColor.secondaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "9:00 PM",
                                            style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppImage.crossIcon,
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Rose Drive, Maplewood",
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "\$600",
                                    style: TextStyle(
                                      color: AppColor.secondaryColor,
                                      fontFamily: AppFont.fontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Popular Events Section
                  _buildSectionTitle("Special" ?? "Popular Events"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categoriesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                           
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.secondaryColor.withOpacity(0.17),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(categoriesList[index]["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: AppColor.secondaryColor,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "12:00 PM",
                                            style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        categoriesList[index]["event"],
                                        style: const TextStyle(
                                          color: AppColor.secondaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "Monday, 15 April 2025",
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "\$400",
                                        style: TextStyle(
                                          color: AppColor.secondaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Past Events Section
                  _buildSectionTitle( "Past Events"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: partiesist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                           
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.secondaryColor.withOpacity(0.17),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    partiesist[index]["image"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 120,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Rhythm Riot",
                                        style: TextStyle(
                                          color: AppColor.secondaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 6,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "10:00 PM",
                                            style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontFamily: AppFont.fontFamily,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                     
                                      const SizedBox(width: 4),
                                      Text(
                                        "Aurora Square, Berlin",
                                        style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontFamily: AppFont.fontFamily,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColor.secondaryColor,
          fontFamily: AppFont.fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}