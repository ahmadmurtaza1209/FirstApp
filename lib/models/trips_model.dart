class TripsModel {
  late final String image;
  late final String name;
  late final String dateTime;
  late final String price;

  TripsModel(
      {required String image,
      required String name,
      required String dateTime,
      required String price}) {
    this.image = image;
    this.name = name;
    this.dateTime = dateTime;
    this.price = price;
  }
}
