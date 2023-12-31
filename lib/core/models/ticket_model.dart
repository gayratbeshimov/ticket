class TicketModel {
  String? name;
  String? topic;
  String? date;
  String? place;
  int? numberOfSeats;
  num? ticketPrice;
  String? currency;
  String? thumbnail;
  String? description;

  TicketModel(
      {this.name,
      this.topic,
      this.date,
      this.place,
      this.numberOfSeats,
      this.ticketPrice,
      this.currency,
      this.thumbnail,
      this.description});

  TicketModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    topic = json['topic'];
    date = json['date'];
    place = json['place'];
    numberOfSeats = json['number_of_seats'];
    ticketPrice = json['ticket_price'];
    currency = json['currency'];
    thumbnail = json['thumbnail'];
    description = json['description'];
  }

  static Map<String, dynamic> toJson(TicketModel model) {
    final Map<String, dynamic> data = {};
    data['name'] = model.name;
    data['topic'] = model.topic;
    data['date'] = model.date;
    data['place'] = model.place;
    data['number_of_seats'] = model.numberOfSeats;
    data['ticket_price'] = model.ticketPrice;
    data['currency'] = model.currency;
    data['thumbnail'] = model.thumbnail;
    data['description'] = model.description;
    return data;
  }
}
