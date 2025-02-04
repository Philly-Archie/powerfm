class Event {
  final int id;
  final String date;
  final String modified;
  final String slug;
  final String status;
  final String type;
  final String link;
  final String title;
  final String content;
  final int featuredMedia;

  Event({
    required this.id,
    required this.date,
    required this.modified,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.featuredMedia,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      date: json['date'],
      modified: json['modified'],
      slug: json['slug'],
      status: json['status'],
      type: json['type'],
      link: json['link'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      featuredMedia: json['featured_media'],
    );
  }
}
