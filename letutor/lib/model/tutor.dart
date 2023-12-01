import 'dart:ui';

class Tutor {
  String id;
  String image;
  String name;
  String country;
  int rate;
  String languages;
  String detail;
  bool love;

  List<String> specialties;
  VoidCallback? onLoveChanged;
  Tutor(this.id, this.image, this.name, this.country, this.rate, this.languages,
      this.detail, this.specialties, this.love);

  void toggleLove() {
    love = !love;
    onLoveChanged?.call();
    print(love);
  }
}
