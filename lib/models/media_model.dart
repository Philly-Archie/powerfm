// class Media {
//   final int id;
//   final String date;
//   final String slug;
//   final String status;
//   final String type;
//   final String link;
//   final String title;
//   final int author;
//   final String mediaType;
//   final String mimeType;
//   final MediaDetails mediaDetails;
//   final String sourceUrl;

//   Media({
//     required this.id,
//     required this.date,
//     required this.slug,
//     required this.status,
//     required this.type,
//     required this.link,
//     required this.title,
//     required this.author,
//     required this.mediaType,
//     required this.mimeType,
//     required this.mediaDetails,
//     required this.sourceUrl,
//   });

//   factory Media.fromJson(Map<String, dynamic> json) {
//     return Media(
//       id: json['id'],
//       date: json['date'],
//       slug: json['slug'],
//       status: json['status'],
//       type: json['type'],
//       link: json['link'],
//       title: json['title']['rendered'],
//       author: json['author'],
//       mediaType: json['media_type'],
//       mimeType: json['mime_type'],
//       mediaDetails: MediaDetails.fromJson(json['media_details']),
//       sourceUrl: json['source_url'],
//     );
//   }
// }

// class MediaDetails {
//   final int width;
//   final int height;
//   final String file;
//   final int fileSize;
//   final Map<String, ImageSize> sizes;

//   MediaDetails({
//     required this.width,
//     required this.height,
//     required this.file,
//     required this.fileSize,
//     required this.sizes,
//   });

//   factory MediaDetails.fromJson(Map<String, dynamic> json) {
//     return MediaDetails(
//       width: json['width'],
//       height: json['height'],
//       file: json['file'],
//       fileSize: json['filesize'] ?? 0,
//       sizes: (json['sizes'] as Map<String, dynamic>?)?.map(
//             (key, value) => MapEntry(key, ImageSize.fromJson(value)),
//           ) ??
//           {},
//     );
//   }
// }

// class ImageSize {
//   final String file;
//   final int width;
//   final int height;
//   final int fileSize;
//   final String sourceUrl;

//   ImageSize({
//     required this.file,
//     required this.width,
//     required this.height,
//     required this.fileSize,
//     required this.sourceUrl,
//   });

//   factory ImageSize.fromJson(Map<String, dynamic> json) {
//     return ImageSize(
//       file: json['file'],
//       width: json['width'],
//       height: json['height'],
//       fileSize: json['filesize'] ?? 0,
//       sourceUrl: json['source_url'],
//     );
//   }
// }

class WordPressMedia {
  final int id;
  final String title;
  final String sourceUrl;
  final DateTime date;

  WordPressMedia({
    required this.id,
    required this.title,
    required this.sourceUrl,
    required this.date,
  });

  factory WordPressMedia.fromJson(Map<String, dynamic> json) {
    return WordPressMedia(
      id: json['id'],
      title: json['title']['rendered'],
      sourceUrl: json['source_url'],
      date: DateTime.parse(json['date']),
    );
  }
}
