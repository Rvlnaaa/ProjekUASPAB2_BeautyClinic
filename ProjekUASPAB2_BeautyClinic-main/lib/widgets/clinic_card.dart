import 'package:flutter/material.dart';
import '../models/clinic_model.dart';

Widget clinicCard(
  ClinicModel clinic,
) {

  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(
        0.9,
      ),

      borderRadius:
          BorderRadius.circular(20),
    ),

    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Expanded(
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(
              top: Radius.circular(
                20,
              ),
            ),

            child: Image.asset(
              clinic.image,

              width: double.infinity,

              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding:
              const EdgeInsets.all(
            10,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,

            children: [

              Text(
                clinic.name,

                maxLines: 1,

                overflow:
                    TextOverflow
                        .ellipsis,

                style:
                    const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(
                  height: 5),

              Text(
                "⭐ ${clinic.rating}",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}