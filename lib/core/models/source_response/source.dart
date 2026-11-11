class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    description = data['description'];
    url = data['url'];
    category = data['category'];
    language = data['language'];
    country = data['country'];
  }
}
