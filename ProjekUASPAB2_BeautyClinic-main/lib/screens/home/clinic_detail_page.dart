import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/clinic_model.dart';
import '../../models/review_model.dart';
import '../../models/dummy_notification.dart';
import '../../models/notification_model.dart';
import '../auth/login_page.dart';

class ClinicDetailPage extends StatefulWidget {
  final ClinicModel clinic;

  const ClinicDetailPage({
    super.key,
    required this.clinic,
  });

  @override
  State<ClinicDetailPage> createState() =>
      _ClinicDetailPageState();
}

class _ClinicDetailPageState
    extends State<ClinicDetailPage> {

  final List<ReviewModel> reviews = [];

  final TextEditingController
      reviewController =
          TextEditingController();

  int selectedRating = 0;

  File? selectedImage;

  final ImagePicker picker =
      ImagePicker();

  Future<void> pickFromCamera()
  async {

    final XFile? image =
        await picker.pickImage(
      source:
          ImageSource.camera,
    );

    if (image != null) {

      setState(() {

        selectedImage =
            File(image.path);
      });
    }
  }

  Future<void> pickFromGallery()
  async {

    final XFile? image =
        await picker.pickImage(
      source:
          ImageSource.gallery,
    );

    if (image != null) {

      setState(() {

        selectedImage =
            File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.clinic.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            /// FOTO KLINIK
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(
                bottom:
                    Radius.circular(20),
              ),

             child: Image.asset(
  widget.clinic.image,

  width: double.infinity,

  height: 250,

  fit: BoxFit.cover,
),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                 Row(
  children: [

    Expanded(
      child: Text(
        widget.clinic.name,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    IconButton(
      onPressed: () {

        setState(() {

          widget.clinic.isFavorite =
              !widget.clinic.isFavorite;
        });

      },

      icon: Icon(
        widget.clinic.isFavorite
            ? Icons.favorite
            : Icons.favorite_border,

        color: Colors.red,
      ),
    ),
  ],
),
                  const SizedBox(
                    height: 10,
                  ),

                  /// RATING
      Row(
  children: List.generate(
    5,
    (index) {

      return IconButton(
        onPressed: () {

          setState(() {
            selectedRating = index + 1;
          });

        },

        icon: Icon(
          Icons.star,
          color: index < selectedRating
              ? Colors.amber
              : Colors.grey,
        ),
      );
    },
  ),
),

                  const SizedBox(
                    height: 15,
                  ),

                  /// ALAMAT
                  const Text(
                    "Alamat",

                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,

                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    widget.clinic.address
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  /// DESKRIPSI
                  const Text(
                    "Deskripsi",

                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,

                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    widget.clinic.description,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

SizedBox(
  width: double.infinity,

  child: ElevatedButton.icon(
    onPressed: () async {

      final Uri url =
          Uri.parse(
       widget.clinic.mapsUrl
      );

      if (await canLaunchUrl(
        url,
      )) {

        await launchUrl(
          url,

          mode:
              LaunchMode
                  .externalApplication,
        );
      }
    },

    icon: const Icon(
      Icons.map,
    ),

    label: const Text(
      "Lihat di Google Maps",
    ),
  ),
),
                  const SizedBox(
                    height: 30,
                  ),

                  /// ULASAN
                  const Text(
                    "Ulasan Pengguna",

                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,

                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

ElevatedButton.icon(
  onPressed: () {

  setState(() {
    selectedRating = 0;
    reviewController.clear();
    selectedImage = null;
  });

    showDialog(
      context: context,

      builder: (context) {

       return AlertDialog(
  title: const Text(
    'Tambah Ulasan',
  ),

  content: StatefulBuilder(
    builder: (
      context,
      dialogSetState,
    ) {

    return SingleChildScrollView(
  child: SizedBox(
    width: 280,

    child: Column(
      mainAxisSize:
          MainAxisSize.min,

      children: [

        const Text(
          'Berikan Rating',
        ),

        const SizedBox(
          height: 10,
        ),

    Wrap(
  alignment: WrapAlignment.center,
  spacing: 10,
  runSpacing: 10,

  children:
      List.generate(
    5,
            (index) {

              return IconButton(
                onPressed: () {

                  dialogSetState(
                    () {

                      selectedRating =
                          index +
                              1;
                    },
                  );
                },

                icon: Icon(
                  index <
                          selectedRating
                      ? Icons.star
                      : Icons
                          .star_border,

                  color:
                      Colors.amber,
                ),
              );
            },
          ),
        ),

        const SizedBox(
  height: 10,
),

Wrap(
  alignment: WrapAlignment.center,
  spacing: 10,
  runSpacing: 10,

  children: [

    ElevatedButton.icon(
      onPressed: pickFromCamera,
      icon: const Icon(
        Icons.camera_alt,
      ),
      label: const Text(
        'Kamera',
      ),
    ),

    ElevatedButton.icon(
      onPressed: pickFromGallery,
      icon: const Icon(
        Icons.photo,
      ),
      label: const Text(
        'Galeri',
      ),
    ),
  ],
),

const SizedBox(
  height: 10,
),

if (selectedImage != null)

Center(
  child: ClipRRect(
    borderRadius:
        BorderRadius.circular(12),

    child: Image.file(
      selectedImage!,

      width: 220,
      height: 150,

      fit: BoxFit.cover,
    ),
  ),
),

const SizedBox(
  height: 10,
),

        const SizedBox(
          height: 10,
        ),

        TextField(
          controller:
              reviewController,

          decoration:
              const InputDecoration(
            hintText:
                'Tulis ulasan...',
          ),
        ),
            ],
    ),
  ),
);
    
  },
),

          actions: [

            TextButton(
              onPressed: () {

                setState(() {

  reviews.add(
  ReviewModel(
    userName:
        LoginPage.userName,

    comment:
        reviewController.text,

    rating:
        selectedRating,
    
    imagePath: 
        selectedImage?.path,
  ),
);
                });

               reviewController.clear();

selectedImage = null;
selectedRating = 0;

notifications.insert(
  0,
  NotificationModel(
    title: 'Ulasan Baru',
    message:
        'Ulasan baru ditambahkan pada ${widget.clinic.name}',
    dateTime: DateTime.now(),
  ),
);

Navigator.pop(
  context,
);
              },

              child:
                  const Text(
                'Simpan',
              ),
            ),
          ],
        );
      },
    );
  },

  icon: const Icon(
    Icons.add,
  ),

  label: const Text(
    'Tambah Ulasan',
  ),
),

const SizedBox(height: 15),

ListView.builder(
  shrinkWrap: true,

  physics:
      const NeverScrollableScrollPhysics(),

  itemCount:
      reviews.length,

  itemBuilder:
      (context, index) {

    final review =
        reviews[index];

  return reviewCard(
  review.userName,
  review.comment,
  review.rating,
  review.imagePath,
);
  },
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget reviewCard(
  String name,
  String comment,
  int rating,
  String? imagePath,
) {

  return Card(
    margin: const EdgeInsets.only(
      bottom: 10,
    ),

    child: ListTile(
      leading: const CircleAvatar(
        child: Icon(
          Icons.person,
        ),
      ),

      title: Text(name),

      subtitle: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(comment),

          if (imagePath != null)

Align(
  alignment: Alignment.centerLeft,

  child: GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Image.file(
            File(imagePath),
          ),
        ),
      );
    },

    child: ClipRRect(
      borderRadius:
          BorderRadius.circular(12),

      child: Image.file(
        File(imagePath),

        width: 220,
        height: 180,

        fit: BoxFit.cover,
      ),
    ),
  ),
            ),
        ],
      ),

      trailing: Text(
        '⭐ $rating',
      ),
    ),
  );
}
}