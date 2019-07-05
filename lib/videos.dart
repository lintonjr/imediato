import 'dart:convert' as convert;

class VideoResponse {
  List<Video> videos;

  VideoResponse.fromJson(Map<String, dynamic> json)
      : videos = json["data"] != null
            ? json["data"].map<Video>((json) => Video.fromJson(json)).toList()
            : null;
}

class Video {
  final String embedHtml;

  Video.fromJson(Map<String, dynamic> json)
      : embedHtml = json["embed_html"] != null ? json["embed_html"].map<Video>((json) => Video.fromJson(json)).toList()
            : null;

  @override
  String toString() {
    print(embedHtml);
    return '$embedHtml'.replaceAll(
      new RegExp(
        r'width=\"640\" height=\"360\" style=\"border:none;overflow:hidden\"scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" allowFullScreen=\"true\"'
        ),
    '');
  }
}

class VideoService {
  static Future<VideoResponse> getVideos() async {
    try {

      final json = "https://graph.facebook.com/v3.3/imediatoonline/live_videos?access_token=EAAfK9JA4T3kBAPl0ZAkBwiUUTNBq0XphXcsi9ekicMfqF1JQhm6ZCuZCEvZAqpWHndvzyIj70aWQ8iU84WFa61lZA6hABDmN4W5MM37UZBJ9U30Ykeuu1DlbrmkQcaC3yrPTXmdGE37cuWr1ZCXHHTvKzacShN2Uw51TdY0ZBlyilgZDZD";
      print(json);

      final map = convert.json.decode(json);
      print(map);

      VideoResponse response = VideoResponse.fromJson(map);

      return response;
    } catch (error) {
      print(error);
    }
  }
}