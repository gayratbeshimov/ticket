class APIConst {
  String apiURL = "http://127.0.0.1:8000/";

  String signUpURL = "user/registration/";
  String loginURL = "user/login/";
  String eventListURL = "events/all/";
  String searchEventURL = "events/search/";
  String updateURL(int id) => "events/$id/update/";
  String updatePatchURL(int id) => "events/$id/update/";
  String createTicketURL = "events/create/";
  String deleteURL(int id) => "delete/$id/event/";
}
