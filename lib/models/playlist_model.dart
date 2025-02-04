class Playlist {
  final int id;
  final String date;
  final String dateGmt;
  final Guid guid;
  final String modified;
  final String modifiedGmt;
  final String slug;
  final String status;
  final String type;
  final String link;
  final Title title;
  final Content content;
  final Excerpt excerpt;
  final int author;
  final int featuredMedia;
  final String commentStatus;
  final String pingStatus;
  final String template;
  final List<dynamic> playlistCategory;
  final List<dynamic> playlistTag;
  final List<String> classList;
  final List<dynamic> acf;
  final List<dynamic> aioseoNotices;
  final Links links;

  Playlist({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.template,
    required this.playlistCategory,
    required this.playlistTag,
    required this.classList,
    required this.acf,
    required this.aioseoNotices,
    required this.links,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      date: json['date'],
      dateGmt: json['date_gmt'],
      guid: Guid.fromJson(json['guid']),
      modified: json['modified'],
      modifiedGmt: json['modified_gmt'],
      slug: json['slug'],
      status: json['status'],
      type: json['type'],
      link: json['link'],
      title: Title.fromJson(json['title']),
      content: Content.fromJson(json['content']),
      excerpt: Excerpt.fromJson(json['excerpt']),
      author: json['author'],
      featuredMedia: json['featured_media'],
      commentStatus: json['comment_status'],
      pingStatus: json['ping_status'],
      template: json['template'],
      playlistCategory: json['playlist-category'] ?? [],
      playlistTag: json['playlist-tag'] ?? [],
      classList: List<String>.from(json['class_list'] ?? []),
      acf: json['acf'] ?? [],
      aioseoNotices: json['aioseo_notices'] ?? [],
      links: Links.fromJson(json['_links']),
    );
  }
}

class Guid {
  final String rendered;

  Guid({required this.rendered});

  factory Guid.fromJson(Map<String, dynamic> json) {
    return Guid(
      rendered: json['rendered'],
    );
  }
}

class Title {
  final String rendered;

  Title({required this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      rendered: json['rendered'],
    );
  }
}

class Content {
  final String rendered;
  final bool isProtected;

  Content({required this.rendered, required this.isProtected});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      rendered: json['rendered'],
      isProtected: json['protected'],
    );
  }
}

class Excerpt {
  final String rendered;
  final bool isProtected;

  Excerpt({required this.rendered, required this.isProtected});

  factory Excerpt.fromJson(Map<String, dynamic> json) {
    return Excerpt(
      rendered: json['rendered'],
      isProtected: json['protected'],
    );
  }
}

class Links {
  final List<Self> self;
  final List<Collection> collection;
  final List<About> about;
  final List<Author> author;
  final List<Reply> replies;
  final List<WpAttachment> wpAttachment;
  final List<WpTerm> wpTerm;
  final List<Cury> curies;

  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.author,
    required this.replies,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: (json['self'] as List).map((e) => Self.fromJson(e)).toList(),
      collection: (json['collection'] as List)
          .map((e) => Collection.fromJson(e))
          .toList(),
      about: (json['about'] as List).map((e) => About.fromJson(e)).toList(),
      author: (json['author'] as List).map((e) => Author.fromJson(e)).toList(),
      replies: (json['replies'] as List).map((e) => Reply.fromJson(e)).toList(),
      wpAttachment: (json['wp:attachment'] as List)
          .map((e) => WpAttachment.fromJson(e))
          .toList(),
      wpTerm: (json['wp:term'] as List).map((e) => WpTerm.fromJson(e)).toList(),
      curies: (json['curies'] as List).map((e) => Cury.fromJson(e)).toList(),
    );
  }
}

class Self {
  final String href;
  final TargetHints targetHints;

  Self({required this.href, required this.targetHints});

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'],
      targetHints: TargetHints.fromJson(json['targetHints']),
    );
  }
}

class TargetHints {
  final List<String> allow;

  TargetHints({required this.allow});

  factory TargetHints.fromJson(Map<String, dynamic> json) {
    return TargetHints(
      allow: List<String>.from(json['allow']),
    );
  }
}

class Collection {
  final String href;

  Collection({required this.href});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      href: json['href'],
    );
  }
}

class About {
  final String href;

  About({required this.href});

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      href: json['href'],
    );
  }
}

class Author {
  final bool embeddable;
  final String href;

  Author({required this.embeddable, required this.href});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      embeddable: json['embeddable'],
      href: json['href'],
    );
  }
}

class Reply {
  final bool embeddable;
  final String href;

  Reply({required this.embeddable, required this.href});

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      embeddable: json['embeddable'],
      href: json['href'],
    );
  }
}

class WpAttachment {
  final String href;

  WpAttachment({required this.href});

  factory WpAttachment.fromJson(Map<String, dynamic> json) {
    return WpAttachment(
      href: json['href'],
    );
  }
}

class WpTerm {
  final String taxonomy;
  final bool embeddable;
  final String href;

  WpTerm(
      {required this.taxonomy, required this.embeddable, required this.href});

  factory WpTerm.fromJson(Map<String, dynamic> json) {
    return WpTerm(
      taxonomy: json['taxonomy'],
      embeddable: json['embeddable'],
      href: json['href'],
    );
  }
}

class Cury {
  final String name;
  final String href;
  final bool templated;

  Cury({required this.name, required this.href, required this.templated});

  factory Cury.fromJson(Map<String, dynamic> json) {
    return Cury(
      name: json['name'],
      href: json['href'],
      templated: json['templated'],
    );
  }
}
