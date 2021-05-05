class PhotoId {
  PhotoId(
    this.imageFront,
    this.expirationDate,
  );
  final String imageFront;
  final String expirationDate;

  PhotoId.fromJson(Map<String, dynamic> json)
      : imageFront = json['ImageFront'],
        expirationDate = json['ExpirationDate'];

  Map<String, dynamic> toJson() {
    return {'ImageFront': imageFront, 'ExpirationDate': expirationDate};
  }
}
