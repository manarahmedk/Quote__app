class QuoteModel {
  String? qotdDate;
  Quote? quote;

  QuoteModel({this.qotdDate, this.quote});

  QuoteModel.fromJson(Map<String,dynamic> json){
    qotdDate=json['qotd_date'];
    quote=Quote.fromJson(json['quote']);
  }
}

class Quote {
  int? id;
  bool? dialogue;
  bool? private;
  List<String>? tags;
  String? url;
  int? favoritesCount;
  int? upvotesCount;
  int? downvotesCount;
  String? author;
  String? authorPermalink;
  String? body;

  Quote({
    this.id,
    this.dialogue,
    this.private,
    this.tags,
    this.url,
    this.favoritesCount,
    this.upvotesCount,
    this.downvotesCount,
    this.author,
    this.authorPermalink,
    this.body,
  });
  Quote.fromJson(Map<String,dynamic> json){
    id=json['id'];
    body=json['body'];
  }
}
