import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/models/ticket_model.dart';
import 'package:ticket/core/utils/app_logger_util.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  static EventCubit get to => Modular.get<EventCubit>();

  EventCubit() : super(const EventState());

  Future<void> load() async {
    try {
      List<TicketModel> concertTickets = [];
      List<TicketModel> sportTickets = [];
      for (var element in tickets) {
        if (element.topic == "Concert") {
          concertTickets.add(element);
        } else {
          sportTickets.add(element);
        }
      }
      Future.delayed(const Duration(milliseconds: 1200));
      emit(state.copyWith(
        tickets: tickets,
        concertsTickets: concertTickets,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        hasError: true,
        loading: false,
      ));
      AppLoggerUtil.e("$e");
    }
  }
}

List<TicketModel> concertTickets = [];
List<TicketModel> tickets = [
  TicketModel(
    thumbnail: "assets/images/img_1.png",
    date: "17 september",
    name: "Govorit Tashkent",
    currency: "USD",
    ticketPrice: 23,
    description: "Govorit Tashkent",
    numberOfSeats: 123,
    place: "Xalqlar do'stligi",
    topic: "Concert",
  ),
  TicketModel(
    thumbnail: "assets/images/img_2.png",
    date: "17 august",
    name: "Robbie Williams",
    currency: "USD",
    ticketPrice: 55,
    description: "Robbie Williams",
    numberOfSeats: 123,
    place: "LUJO HOTEL",
    topic: "Concert",
  ),
  TicketModel(
    thumbnail: "assets/images/img_3.png",
    date: "11 september",
    name: "Gala konsert",
    currency: "UZS",
    ticketPrice: 500000,
    description: "Gala konsert",
    numberOfSeats: 201,
    place: "Xalqlar do'stligi",
    topic: "Concert",
  ),
  TicketModel(
    thumbnail: "assets/images/img_4.png",
    date: "2 september",
    name: "Serial",
    currency: "USD",
    ticketPrice: 43,
    description: "Serial",
    numberOfSeats: 123,
    place: "Xalqlar do'stligi",
    topic: "Concert",
  ),
  TicketModel(
    thumbnail: "assets/images/img_5.png",
    date: "17 september",
    name: "Valijon Shamsiyev",
    currency: "UZS",
    ticketPrice: 30000,
    description: "Valijon Shamsiyev",
    numberOfSeats: 123,
    place: "Xalqlar do'stligi",
    topic: "Concert",
  ),
  TicketModel(
    thumbnail: "assets/images/img_6.png",
    date: "1 October",
    name: "SURKHON vs TURON",
    currency: "UZS",
    ticketPrice: 50000,
    description: "SURKHON vs TURON",
    numberOfSeats: 12878,
    place: "Surxon markaziy stadion",
    topic: "Sport",
  ),
  TicketModel(
    thumbnail: "assets/images/img_7.png",
    date: "1 October",
    name: "MHSK vs DINAMO",
    currency: "UZS",
    ticketPrice: 480000,
    description: "MHSK vs DINAMO hokkey",
    numberOfSeats: 23000,
    place: "HUMO ARENA",
    topic: "Sport",
  ),
];
