import 'dart:convert';
import 'package:imediato/videos.dart';
import 'package:http/http.dart' as http;

class VideoService {
  static Future<List<Datum>> getVideos() async {
    final url = "https://graph.facebook.com/v3.3/imediatoonline/live_videos?access_token=EAAfK9JA4T3kBAPl0ZAkBwiUUTNBq0XphXcsi9ekicMfqF1JQhm6ZCuZCEvZAqpWHndvzyIj70aWQ8iU84WFa61lZA6hABDmN4W5MM37UZBJ9U30Ykeuu1DlbrmkQcaC3yrPTXmdGE37cuWr1ZCXHHTvKzacShN2Uw51TdY0ZBlyilgZDZD";

    final response = await http.get(url);

    final mapVideos = json.decode(response.body).cast<Map<String, dynamic>>();

    final videos = mapVideos.map<Datum>((json) => Datum.fromJson(json)).toList();

    return videos;
  }
}