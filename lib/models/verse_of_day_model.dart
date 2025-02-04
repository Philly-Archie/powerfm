class VerseOfTheDay {
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
  final int featuredMedia;
  final String template;
  final List<String> classList;
  final Map<String, dynamic> acf;
  final List<dynamic> aioseoNotices;
  final Links links;

  VerseOfTheDay({
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
    required this.featuredMedia,
    required this.template,
    required this.classList,
    required this.acf,
    required this.aioseoNotices,
    required this.links,
  });

  factory VerseOfTheDay.fromJson(Map<String, dynamic> json) {
    return VerseOfTheDay(
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
      featuredMedia: json['featured_media'],
      template: json['template'],
      classList: List<String>.from(json['class_list']),
      acf: json['acf'],
      aioseoNotices: json['aioseo_notices'],
      links: Links.fromJson(json['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'date_gmt': dateGmt,
      'guid': guid.toJson(),
      'modified': modified,
      'modified_gmt': modifiedGmt,
      'slug': slug,
      'status': status,
      'type': type,
      'link': link,
      'title': title.toJson(),
      'content': content.toJson(),
      'featured_media': featuredMedia,
      'template': template,
      'class_list': classList,
      'acf': acf,
      'aioseo_notices': aioseoNotices,
      '_links': links.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'rendered': rendered,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'rendered': rendered,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'rendered': rendered,
      'protected': isProtected,
    };
  }
}

class Links {
  final List<LinkItem> self;
  final List<LinkItem> collection;
  final List<LinkItem> about;
  final List<LinkItem> featuredMedia;
  final List<LinkItem> attachment;
  final List<Curie> curies;

  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.featuredMedia,
    required this.attachment,
    required this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: List<LinkItem>.from(json['self'].map((x) => LinkItem.fromJson(x))),
      collection: List<LinkItem>.from(
          json['collection'].map((x) => LinkItem.fromJson(x))),
      about:
          List<LinkItem>.from(json['about'].map((x) => LinkItem.fromJson(x))),
      featuredMedia: List<LinkItem>.from(
          json['wp:featuredmedia'].map((x) => LinkItem.fromJson(x))),
      attachment: List<LinkItem>.from(
          json['wp:attachment'].map((x) => LinkItem.fromJson(x))),
      curies: List<Curie>.from(json['curies'].map((x) => Curie.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self.map((x) => x.toJson()).toList(),
      'collection': collection.map((x) => x.toJson()).toList(),
      'about': about.map((x) => x.toJson()).toList(),
      'wp:featuredmedia': featuredMedia.map((x) => x.toJson()).toList(),
      'wp:attachment': attachment.map((x) => x.toJson()).toList(),
      'curies': curies.map((x) => x.toJson()).toList(),
    };
  }
}

class LinkItem {
  final String href;
  final Map<String, dynamic>? targetHints;

  LinkItem({required this.href, this.targetHints});

  factory LinkItem.fromJson(Map<String, dynamic> json) {
    return LinkItem(
      href: json['href'],
      targetHints: json['targetHints'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'targetHints': targetHints,
    };
  }
}

class Curie {
  final String name;
  final String href;
  final bool templated;

  Curie({required this.name, required this.href, required this.templated});

  factory Curie.fromJson(Map<String, dynamic> json) {
    return Curie(
      name: json['name'],
      href: json['href'],
      templated: json['templated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'href': href,
      'templated': templated,
    };
  }
}
