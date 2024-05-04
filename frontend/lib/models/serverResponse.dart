class ServerResponse {
  static const String SUCCESS = "Success";
  static const String FAILED = "Failed";
  static const String OFFLINE = "Offline";
  static const String INITIATE = "";

  ServerResponse(this.status, this.statusMessage);

  String status;
  String statusMessage;
  String authToken = '' ;
  int serverTime = 0;
  dynamic data;
  dynamic result;

  ServerResponse.fromJson(Map<String, dynamic>json)
      : status = json['status'],
        statusMessage = json['statusMessage'],
        data = json['data'],
        authToken = json['authToken'] ?? "",
        serverTime = json['serverTime'] ?? 0;

  ifSuccess() {
    return (this.status == SUCCESS);
  }

  ifFailed() {
    return (this.status == FAILED);
  }

  isOffline() {
    return (this.status == OFFLINE);
  }

  isUnAuth() {
    return (this.status != null &&
        this.statusMessage.indexOf("Unauthenticated") >= 0);
  }
}
