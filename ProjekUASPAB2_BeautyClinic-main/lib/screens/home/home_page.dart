import 'package:flutter/material.dart';

import '../../main.dart';
import 'search_page.dart';
import 'notification_page.dart';
import '../../main.dart';
import '../../models/dummy_treatment.dart';
import 'treatment_detail_page.dart';
import '../../models/dummy_clinic.dart';
import 'search_page.dart';
import 'notification_page.dart';
import 'clinic_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  int _currentIndex = 0;

  final PageController _pageController =
      PageController(
    viewportFraction: 0.7,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isEnglishNotifier,

      builder: (
        context,
        bool isEnglish,
        child,
      ) {

        return Scaffold(

  body: Stack(
    children: [

      /// BACKGROUND IMAGE
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/klinik.jpg',
            ),

            fit: BoxFit.cover,
          ),
        ),
      ),

      /// OVERLAY SAMA KAYAK LOGIN & REGISTER
      Container(
        color: Colors.black.withOpacity(
            0.35),
      ),

      SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        /// APPBAR ICON
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .end,

                          children: [

                            IconButton(
                              onPressed: () {

                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage(),
                                  ),
                                );
                              },

                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                       /// TITLE
Center(
  child: Column(
    children: [

      const Text(
        'BeautyLink Palembang',

        textAlign: TextAlign.center,

        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      const SizedBox(height: 8),

      const Text(
        'Temukan Klinik Kecantikan Terbaik di Palembang',

        textAlign: TextAlign.center,

        style: TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 25),

/// CLINIC SLIDER
/// CLINIC SLIDER
SizedBox(
  height: 300,

  child: PageView.builder(
    controller: _pageController,

    itemCount: 4,

    onPageChanged: (index) {

      setState(() {
        _currentIndex = index;
      });
    },

    itemBuilder: (
      context,
      index,
    ) {

      final images = [

        'assets/klinik1.jpg',
        'assets/klinik2.jpg',
        'assets/klinik.jpg',
        'assets/klinik4.jpg',
      ];

      return Padding(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 4,
        ),

        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20),

          child: Image.asset(
            images[index],

            fit: BoxFit.cover,
          ),
        ),
      );
    },
  ),
),

const SizedBox(height: 10),

/// DOT INDICATOR
Row(
  mainAxisAlignment:
      MainAxisAlignment.center,

  children: List.generate(
    4,

    (index) => Container(
      width: 8,
      height: 8,

      margin:
          const EdgeInsets.symmetric(
        horizontal: 4,
      ),

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: _currentIndex == index
            ? Colors.white
            : Colors.white38,
      ),
    ),
  ),
),

const SizedBox(height: 25),

                        /// SEARCH BAR
                        GestureDetector(
                          onTap: () {

                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                    const SearchPage(),
                              ),
                            );
                          },

                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),

                            decoration:
                                BoxDecoration(
                              color: Colors.white
                                  .withOpacity(
                                      0.85),

                              borderRadius:
                                  BorderRadius.circular(
                                15,
                              ),
                            ),

                            child: Row(
                              children: [

                                const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                Text(
                                  isEnglish
                                      ? 'Search'
                                      : 'Cari',

                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),



                        /// CATEGORY TITLE
                        Text(
                          isEnglish
                              ? 'Treatment Category'
                              : 'Kategori Treatment',

                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight:
                                FontWeight.bold,

                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceAround,

                          children: [

                            GestureDetector(
                              onTap: () {

                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) =>
    TreatmentDetailPage(
  treatment:
      dummyTreatment[0],
),
                                  ),
                                );
                              },

                              child:
                                  categoryItem(
                                Icons.face,
                                'Facial',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {

                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) =>
    TreatmentDetailPage(
  treatment:
      dummyTreatment[1],
),
                                  ),
                                );
                              },

                              child:
                                  categoryItem(
                                Icons.spa,
                                'Therapy',
                              ),
                            ),

                            GestureDetector(
                              onTap: () {

                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                   builder: (context) =>
    TreatmentDetailPage(
  treatment:
      dummyTreatment[2],
),
                                  ),
                                );
                              },

                              child:
                                  categoryItem(
                                Icons.auto_awesome,
                                'Glow',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 35),

/// POPULAR CLINICS
Text(
  isEnglish
      ? 'Popular Clinics'
      : 'Klinik Populer',

  style: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
),

const SizedBox(height: 20),

GridView.builder(
  shrinkWrap: true,

  physics:
      const NeverScrollableScrollPhysics(),

  gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 16,
    childAspectRatio: 0.75,
  ),

  itemCount: dummyClinic.length,

  itemBuilder: (
    context,
    index,
  ) {

    final clinic =
        dummyClinic[index];

    return GestureDetector(
   onTap: () {

  Navigator.push(
    context,

    MaterialPageRoute(
      builder: (_) =>
          ClinicDetailPage(
        clinic: clinic,
      ),
    ),
  );
},

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,

        children: [

          Expanded(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(
                15,
              ),

              child: Image.asset(
                clinic.image,

                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            clinic.name,

            maxLines: 1,

            overflow:
                TextOverflow
                    .ellipsis,

            textAlign:
                TextAlign.center,

            style:
                const TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 4,
          ),

         clinic.rating == 0
    ? const Text(
        'Belum ada ulasan',
        style: TextStyle(
          color: Color.fromARGB(255, 233, 228, 228),
          fontSize: 12,
        ),
      )
    : Text(
        '⭐ ${clinic.rating}',
      ),
        ],
      ),
    );
  },
),

const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  Widget categoryItem(
    IconData icon,
    String title,
  ) {

    return Column(
      children: [

        Container(
          padding:
              const EdgeInsets.all(18),

          decoration:
              BoxDecoration(
            color: Colors.white
                .withOpacity(0.85),

            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color:
                const Color(0xFFB89B3C),

            size: 30,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          title,

          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget treatmentCard({
    required String title,
    required String subtitle,
  }) {

    return Container(
      padding:
          const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color:
            Colors.white.withOpacity(
                0.85),

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Container(
            width: 60,
            height: 60,

            decoration: BoxDecoration(
              color:
                  const Color(0xFFF5F0E1),

              borderRadius:
                  BorderRadius.circular(
                15,
              ),
            ),

            child: const Icon(
              Icons.image,
              color: Color(0xFFB89B3C),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [

                Text(
                  title,

                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight.bold,

                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,

                  style: TextStyle(
                    color:
                        Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clinicBanner(
  String image,
) {

  return Container(
    margin:
        const EdgeInsets.symmetric(
      horizontal: 5,
    ),

    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(25),

      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}
}