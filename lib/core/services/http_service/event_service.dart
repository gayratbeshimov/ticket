import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ticket/core/constants/api_const.dart';
import 'package:ticket/core/models/event_model.dart';
import 'package:ticket/core/models/ticket_model.dart';
import 'package:ticket/core/services/http_service/http_service.dart';
import 'package:ticket/core/utils/app_logger_util.dart';

class EventService with APIConst {
  static EventService get to => Modular.get<EventService>();

  Future getEventList() async {
    List<EventModel> list = [];
    try {
      Response? response = await HttpService.to.get(
        apiURL: apiURL,
        path: eventListURL,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          for (var item in response.data) {
            list.add(EventModel.fromJson(item));
          }
          return list;
        }
      }
      return list;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }

  Future searchEventList({required String name}) async {
    List<EventModel> list = [];
    try {
      Response? response = await HttpService.to.get(
        apiURL: apiURL,
        path: searchEventURL,
        parameters: {"search": name},
      );
      if (response != null) {
        if (response.statusCode == 200) {
          for (var item in response.data) {
            list.add(EventModel.fromJson(item));
          }
          return list;
        }
      }
      return list;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }

  Future deleteEvent({required int id}) async {
    try {
      Response? response = await HttpService.to.delete(
        apiURL: apiURL,
        path: deleteURL(id),
      );
      if (response != null) {
        if (response.statusCode == 204) {
          return "Successfully";
        } else {
          return "Error";
        }
      }
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }

  Future updateEvent({
    required int id,
    required TicketModel ticket,
  }) async {
    try {
      Response? response = await HttpService.to.put(
        apiURL: apiURL,
        path: updateURL(id),
        data: TicketModel.toJson(ticket),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return TicketModel.fromJson(response.data);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }

  Future updateEventWithPatch({
    required int id,
    required TicketModel ticket,
  }) async {
    try {
      Response? response = await HttpService.to.patch(
        apiURL: apiURL,
        path: updatePatchURL(id),
        data: TicketModel.toJson(ticket),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return TicketModel.fromJson(response.data);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }

  Future createTicket({
    required TicketModel ticket,
  }) async {
    try {
      Response? response = await HttpService.to.post(
        apiURL: apiURL,
        path: createTicketURL,
        body: TicketModel.toJson(ticket),
      );
      if (response != null) {
        if (response.statusCode == 200) {
          return TicketModel.fromJson(response.data);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      AppLoggerUtil.e("$e");
    }
  }
}
