import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
    List<Datum> data;

    Video({
        this.data,
    });

    factory Video.fromJson(Map<String, dynamic> json) => new Video(
        data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String status;
    String streamUrl;
    String secureStreamUrl;
    String embedHtml;
    String id;

    Datum({
        this.status,
        this.streamUrl,
        this.secureStreamUrl,
        this.embedHtml,
        this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        status: json["status"],
        streamUrl: json["stream_url"],
        secureStreamUrl: json["secure_stream_url"],
        embedHtml: json["embed_html"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "stream_url": streamUrl,
        "secure_stream_url": secureStreamUrl,
        "embed_html": embedHtml,
        "id": id,
    };
}