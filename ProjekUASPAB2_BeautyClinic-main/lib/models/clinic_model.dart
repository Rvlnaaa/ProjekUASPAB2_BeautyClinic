class ClinicModel {
  final String name;
  final String image;
  final String address;
  final String description;
  final double rating;
  final String mapsUrl;
  final List<String> treatments;

  bool isFavorite;

  ClinicModel({
    required this.name,
    required this.image,
    required this.address,
    required this.description,
    required this.rating,
    required this.mapsUrl,
    required this.treatments,
    this.isFavorite = false,
  });
}