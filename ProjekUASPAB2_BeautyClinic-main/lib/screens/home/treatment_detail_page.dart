import 'package:flutter/material.dart';

import '../../models/treatment_model.dart';
import '../../models/dummy_clinic.dart';
import '../home/clinic_detail_page.dart';

class TreatmentDetailPage
    extends StatelessWidget {

  final TreatmentModel treatment;

  const TreatmentDetailPage({
    super.key,
    required this.treatment,
  });

  @override
  Widget build(BuildContext context) {

    final clinics =
        dummyClinic.where(
      (clinic) {

        return clinic.treatments
            .contains(
          treatment.name,
        );
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          treatment.name,
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(
          16,
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(
                15,
              ),

              child: Image.asset(
                treatment.image,

                width:
                    double.infinity,

                height: 220,

                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              treatment.name,

              style:
                  const TextStyle(
                fontSize: 26,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              treatment.description,
            ),

            const SizedBox(
              height: 25,
            ),

            const Text(
              'Klinik yang Menyediakan',

              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            ListView.builder(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              itemCount:
                  clinics.length,

              itemBuilder:
                  (context, index) {

                final clinic =
                    clinics[index];

                return Card(
                  child: ListTile(

                    leading:
                        ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                        8,
                      ),

                      child:
                          Image.asset(
                        clinic.image,

                        width: 55,
                        height: 55,

                        fit:
                            BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      clinic.name,
                    ),

                    subtitle:
                        Text(
                      clinic.address,
                    ),

                    trailing:
                        const Icon(
                      Icons
                          .arrow_forward_ios,
                    ),

                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              ClinicDetailPage(
                            clinic:
                                clinic,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}