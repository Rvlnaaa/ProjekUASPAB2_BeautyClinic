class ReviewModel {
  final String userName;
  final String comment;
  final int rating;
  final String? imagePath;

  ReviewModel({
    required this.userName,
    required this.comment,
    required this.rating,
    this.imagePath,
  });
}