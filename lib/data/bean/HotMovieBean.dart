// To parse this JSON data, do
//
//     final hotMovieBean = hotMovieBeanFromJson(jsonString);

import 'dart:convert';

class HotMovieBean {
    Rating rating;
    List<String> genres;
    String title;
    List<Cast> casts;
    List<String> durations;
    int collectCount;
    DateTime mainlandPubdate;
    bool hasVideo;
    String originalTitle;
    String subtype;
    List<Cast> directors;
    List<String> pubdates;
    String year;
    Images images;
    String alt;
    String id;

    HotMovieBean({
        this.rating,
        this.genres,
        this.title,
        this.casts,
        this.durations,
        this.collectCount,
        this.mainlandPubdate,
        this.hasVideo,
        this.originalTitle,
        this.subtype,
        this.directors,
        this.pubdates,
        this.year,
        this.images,
        this.alt,
        this.id,
    });

    factory HotMovieBean.fromJson(String str) => HotMovieBean.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HotMovieBean.fromMap(Map<String, dynamic> json) => new HotMovieBean(
        rating: Rating.fromMap(json["rating"]),
        genres: new List<String>.from(json["genres"].map((x) => x)),
        title: json["title"],
        casts: new List<Cast>.from(json["casts"].map((x) => Cast.fromMap(x))),
        durations: new List<String>.from(json["durations"].map((x) => x)),
        collectCount: json["collect_count"],
        mainlandPubdate: DateTime.parse(json["mainland_pubdate"]),
        hasVideo: json["has_video"],
        originalTitle: json["original_title"],
        subtype: json["subtype"],
        directors: new List<Cast>.from(json["directors"].map((x) => Cast.fromMap(x))),
        pubdates: new List<String>.from(json["pubdates"].map((x) => x)),
        year: json["year"],
        images: Images.fromMap(json["images"]),
        alt: json["alt"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "rating": rating.toMap(),
        "genres": new List<dynamic>.from(genres.map((x) => x)),
        "title": title,
        "casts": new List<dynamic>.from(casts.map((x) => x.toMap())),
        "durations": new List<dynamic>.from(durations.map((x) => x)),
        "collect_count": collectCount,
        "mainland_pubdate": "${mainlandPubdate.year.toString().padLeft(4, '0')}-${mainlandPubdate.month.toString().padLeft(2, '0')}-${mainlandPubdate.day.toString().padLeft(2, '0')}",
        "has_video": hasVideo,
        "original_title": originalTitle,
        "subtype": subtype,
        "directors": new List<dynamic>.from(directors.map((x) => x.toMap())),
        "pubdates": new List<dynamic>.from(pubdates.map((x) => x)),
        "year": year,
        "images": images.toMap(),
        "alt": alt,
        "id": id,
    };
}

class Cast {
    Images avatars;
    String nameEn;
    String name;
    String alt;
    String id;

    Cast({
        this.avatars,
        this.nameEn,
        this.name,
        this.alt,
        this.id,
    });

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cast.fromMap(Map<String, dynamic> json) => new Cast(
        avatars: Images.fromMap(json["avatars"]),
        nameEn: json["name_en"],
        name: json["name"],
        alt: json["alt"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "avatars": avatars.toMap(),
        "name_en": nameEn,
        "name": name,
        "alt": alt,
        "id": id,
    };
}

class Images {
    String small;
    String large;
    String medium;

    Images({
        this.small,
        this.large,
        this.medium,
    });

    factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Images.fromMap(Map<String, dynamic> json) => new Images(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
    );

    Map<String, dynamic> toMap() => {
        "small": small,
        "large": large,
        "medium": medium,
    };
}

class Rating {
    int max;
    double average;
    String stars;
    int min;

    Rating({
        this.max,
        this.average,
        this.stars,
        this.min,
    });

    factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Rating.fromMap(Map<String, dynamic> json) => new Rating(
        max: json["max"],
        average: json["average"].toDouble(),
        stars: json["stars"],
        min: json["min"],
    );

    Map<String, dynamic> toMap() => {
        "max": max,
        "average": average,
        "stars": stars,
        "min": min,
    };
}
