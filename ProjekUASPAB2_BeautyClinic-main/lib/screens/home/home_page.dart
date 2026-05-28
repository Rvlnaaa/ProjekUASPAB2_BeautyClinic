import 'package:flutter/material.dart';

import '../../main.dart';
import '../treatment/treatment_detail_page.dart';
import 'search_page.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          backgroundColor:
              Theme.of(context)
                  .scaffoldBackgroundColor,

          appBar: AppBar(
            backgroundColor:
                Theme.of(context)
                    .scaffoldBackgroundColor,

            elevation: 0,

            actions: [

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

                icon: Icon(
                  Icons.notifications,

                  color:
                      Theme.of(context)
                          .iconTheme
                          .color,
                ),
              ),
            ],
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

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

                        decoration: BoxDecoration(
                          color:
                              Colors.grey.shade100,

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
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// TITLE
                    Text(
                      isEnglish
                          ? 'Beauty Clinic'
                          : 'Klinik Kecantikan',

                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// PROMO CARD
                    Container(
                      height: 150,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color:
                            const Color(0xFFB89B3C),

                        borderRadius:
                            BorderRadius.circular(
                          25,
                        ),
                      ),

                      child: Center(
                        child: Text(
                          isEnglish
                              ? 'Special Day Promo'
                              : 'Promo Hari Spesial',

                          style:
                              const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
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
                                  title: isEnglish
                                      ? 'Facial Treatment'
                                      : 'Treatment Facial',

                                  description:
                                      isEnglish
                                          ? 'Facial treatment to clean and nourish facial skin.'
                                          : 'Perawatan facial untuk membersihkan dan menyehatkan kulit wajah.',
                                ),
                              ),
                            );
                          },

                          child: categoryItem(
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
                                  title: isEnglish
                                      ? 'Therapy Treatment'
                                      : 'Treatment Therapy',

                                  description:
                                      isEnglish
                                          ? 'Therapy treatment helps relaxation and skin health.'
                                          : 'Therapy treatment membantu relaksasi dan kesehatan kulit.',
                                ),
                              ),
                            );
                          },

                          child: categoryItem(
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
                                  title: isEnglish
                                      ? 'Glow Treatment'
                                      : 'Treatment Glow',

                                  description:
                                      isEnglish
                                          ? 'Glow treatment helps the face look brighter and glowing.'
                                          : 'Glow treatment membantu wajah tampak lebih cerah dan glowing.',
                                ),
                              ),
                            );
                          },

                          child: categoryItem(
                            Icons.auto_awesome,
                            'Glow',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    /// POPULAR TITLE
                    Text(
                      isEnglish
                          ? 'Popular Treatment'
                          : 'Treatment Populer',

                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                TreatmentDetailPage(
                              title:
                                  'Anti Facial Acne',

                              description:
                                  isEnglish
                                      ? 'The best facial treatment to treat acne and maintain healthy skin.'
                                      : 'Treatment wajah terbaik untuk mengatasi jerawat dan menjaga kesehatan kulit.',
                            ),
                          ),
                        );
                      },

                      child: treatmentCard(
                        title:
                            'Anti Facial Acne',

                        subtitle: isEnglish
                            ? 'Best facial treatment for healthy skin'
                            : 'Treatment wajah terbaik untuk kulit sehat',
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              const BoxDecoration(
            color: Color(0xFFF5F0E1),
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

        Text(title),
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
        color: Colors.grey.shade100,

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
                        Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}