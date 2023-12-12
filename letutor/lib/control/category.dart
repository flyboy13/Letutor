class Category {
  String id;
  String key;
  String title;
  String description;

  Category({
    this.id = '',
    this.description = '',
    this.key = '',
    this.title = '',
  });

  factory Category.fromJson(json) {
    return Category(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      key: json['key'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
