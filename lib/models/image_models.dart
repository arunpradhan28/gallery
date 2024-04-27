class ImageModel {
  final int id;
  final String imageUrl;
  final int likes;
  final int views;

  ImageModel({
    required this.id,
    required this.imageUrl,
    required this.likes,
    required this.views,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? 0,
      imageUrl: json['webformatURL'] ?? '', // Adjust this according to Pixabay API response
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0,
    );
  }
}
