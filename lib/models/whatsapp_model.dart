class WhatsAppModel {
  final String? image;
  final String? name;
  final String? message;
  final String? dateTime;
  final String? icon;
  WhatsAppModel(
      {this.image,
      this.name,
      this.message = "",
      this.dateTime,
      this.icon = ""});
}
