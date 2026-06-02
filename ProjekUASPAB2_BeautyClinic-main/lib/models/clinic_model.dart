class ClinicModel {

  final String name;
  final String image;
  final String address;
  final String description;
  final String mapsUrl;
  final double rating;

  final List<String> treatments;

  ClinicModel({
    required this.name,
    required this.image,
    required this.address,
    required this.description,
    required this.mapsUrl,
    required this.rating,
    required this.treatments,
  });
}