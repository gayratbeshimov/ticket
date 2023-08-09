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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['topic'] = topic;
    data['date'] = date;
    data['place'] = place;
    data['number_of_seats'] = numberOfSeats;
    data['ticket_price'] = ticketPrice;
    data['currency'] = currency;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    return data;
  }
}
