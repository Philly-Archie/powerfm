class Post {
  final int id;
  final DateTime date;
  final DateTime dateGmt;
  final DateTime modified;
  final DateTime modifiedGmt;
  final String slug;
  final String status;
  final String type;
  final String link;
  final Title title;
  final Content content;
  final int author;
  final int featuredMedia;
  final String commentStatus;
  final String pingStatus;
  final bool sticky;
  final String template;
  final String format;
  final List<int> categories;
  final List<int> tags;
  final List<Author> authors;

  Post({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.categories,
    required this.tags,
    required this.authors,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      date: DateTime.parse(json['date']),
      dateGmt: DateTime.parse(json['date_gmt']),
      modified: DateTime.parse(json['modified']),
      modifiedGmt: DateTime.parse(json['modified_gmt']),
      slug: json['slug'],
      status: json['status'],
      type: json['type'],
      link: json['link'],
      title: Title.fromJson(json['title']),
      content: Content.fromJson(json['content']),
      author: json['author'],
      featuredMedia: json['featured_media'],
      commentStatus: json['comment_status'],
      pingStatus: json['ping_status'],
      sticky: json['sticky'],
      template: json['template'],
      format: json['format'],
      categories: List<int>.from(json['categories']),
      tags: List<int>.from(json['tags']),
      authors:
          (json['authors'] as List).map((e) => Author.fromJson(e)).toList(),
    );
  }
}

class Author {
  final int termId;
  final int userId;
  final bool isGuest;
  final String slug;
  final String displayName;
  final String avatarUrl;

  Author({
    required this.termId,
    required this.userId,
    required this.isGuest,
    required this.slug,
    required this.displayName,
    required this.avatarUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        termId: json['term_id'],
        userId: json['user_id'],
        isGuest: json['is_guest'],
        slug: json['slug'],
        displayName: json['display_name'],
        avatarUrl: json['avatar_url'],
      );
}

class Title {
  final String rendered;

  Title({required this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) =>
      Title(rendered: json['rendered']);
}

class Content {
  final String rendered;
  final bool protected;

  Content({required this.rendered, required this.protected});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json['rendered'],
        protected: json['protected'],
      );
}

// class Excerpt {
//   final String rendered;
//   final bool protected;

//   Excerpt({required this.rendered, required this.protected});

//   factory Excerpt.fromJson(Map<String, dynamic> json) => Excerpt(
//         rendered: json['rendered'],
//         protected: json['protected'],
//       );
// }

