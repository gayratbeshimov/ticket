class EventModel {
  int? id;
  String? name;
  String? topic;
  String? date;
  String? place;
  int? numberOfSeats;
  String? ticketPrice;
  String? currency;
  int? host;
  List<int>? guests;
  String? thumbnail;
  String? description;

  EventModel(
      {this.id,
      this.name,
      this.topic,
      this.date,
      this.place,
      this.numberOfSeats,
      this.ticketPrice,
      this.currency,
      this.host,
      this.guests,
      this.thumbnail,
      this.description});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    topic = json['topic'];
    date = json['date'];
    place = json['place'];
    numberOfSeats = json['number_of_seats'];
    ticketPrice = json['ticket_price'];
    currency = json['currency'];
    host = json['host'];
    guests = json['guests'].cast<int>();
    thumbnail = json['thumbnail'];
    description = json['description'];
  }

  static Map<String, dynamic> toJson(EventModel model) {
    final Map<String, dynamic> data = {};
    data['id'] = model.id;
    data['name'] = model.name;
    data['topic'] = model.topic;
    data['date'] = model.date;
    data['place'] = model.place;
    data['number_of_seats'] = model.numberOfSeats;
    data['ticket_price'] = model.ticketPrice;
    data['currency'] = model.currency;
    data['host'] = model.host;
    data['guests'] = model.guests;
    data['thumbnail'] = model.thumbnail;
    data['description'] = model.description;
    return data;
  }
}
