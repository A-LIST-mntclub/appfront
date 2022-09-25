class Album {
  final String name;
  final String chapter;
  final String date;
  final String url;

  const Album({required this.name, required this.chapter, required this.date, required this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      chapter: json['chapter'],
      date: json['date'],
      url: json['url'],
    );
  }
}