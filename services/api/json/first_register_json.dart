
//{
//    "message": "Registro exitoso",
//    "idUser": "dea27f6c-d169-11ec-ab14-b1c48971d5cd",
//    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImRlYTI3ZjZjLWQxNjktMTFlYy1hYjE0LWIxYzQ4OTcxZDVjZCIsImVtYWlsIjoiYWVya2xnbmFsYXNmamduQGdtYWlsLmNvbSIsIm5hbWVzIjoicm9ubnlhIDEyMyIsInBob25lIjoiOTMxNTQ4NDYwIiwic3RhdGUiOiJSZWdpc3RybyBJbmNvbXBsZXRvIiwic2VsZmllIjpudWxsLCJhZGRyZXNzIjoiaHVudGVyIGNpdHkiLCJpZFN0YXRlIjo0LCJwcm92aW5jZSI6bnVsbCwic3VybmFtZXMiOiJmbGtnbmHDsWZqZ25zamtmbmdza2FqIiwidmlkZW9BdXRoIjpmYWxzZSwiZGVwYXJ0bWVudCI6IkNoYWNoYXBveWFzIiwiaWRQcm92aW5jZSI6IjAxMDEiLCJpc29MYW5ndWFnZSI6ImVzIiwibnVtRG9jdW1lbnQiOiIxMTExMTExMSIsInByZWZpeFBob25lIjoiKzUxIiwiaWREZXBhcnRtZW50IjoiMDEiLCJpZFR5cGVEb2N1bWVudCI6MSwiZG9jdW1lbnREZXNjcmlwdGlvbiI6IkVzdGFkbyBVc3VhcmlvIiwiaWF0IjoxNjUyMzAxMzE4LCJleHAiOjE2NTIzODc3MTh9.GMWzV_IHKF57Yoh208Vas07_hPgx0rLcWRwJoG4Bxqw",
//    "idDevice": "U2FsdGVkX1/X+MzUWiYuvrQCwtVXpdVmFmB3iXLyytuDG4ePDNyP+NrJ8oT26gyJd12/xk5tSiqJ1wcbb/r7cw9KW5dHIp3GULU8dmd3MOENtT7rAkLhtT2NBSquwxKUzZ4fOalUqOIu9zBxb6zF6ZPD1P54EJePZ1iE9Ai3GSRKWhCf/7i0gYdvr34/PhmUMA0L7vSOz+nMHdAkFwqEwWgLsLITJj7t8+hVOGydDLIbGs2ikW7uVZacr4+X31Y8Il7eSdo3p3TlVMiPZFCrbHBdsp5fBQOrXhlx2955m/pvunSzJ/co7pjaF72z5mkEzVeAH/h3GBmeeBN7x/f90VFq6GN7RhkjRbR+YVho3fjAI3ffGRrfKNspVA2u6hVp9SPmYcu/a6GEIp8Oel1kfdj/dcfmN5Xuctt3ncGgCXc3szXhGXk5i1UH3epkPsCbLGTqrE7Zhij68ev2iiwXU/iz88bAui547q5EfXPbQ0AAUuw0+FA1aRizHkxz9n3o1AwQLCB2Y0ftN/FTQCGpXuTBcO15lTmKL9KSHh1xYluDenCTgAqapeXdyesZCJPIceQX9KnDaQNvDKfCJ3plYvGGmbyETHfaYW+Ou9po3jqC5Cxu6HSjUvS/zr6OjEUO"
//}

class FirstRegisterJson {
  String? message;
  String? idUser;
  String? token;
  String? idDevice;

  FirstRegisterJson({this.message, this.idUser, this.token, this.idDevice});

  FirstRegisterJson.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    idUser = json['idUser'];
    token = json['token'];
    idDevice = json['idDevice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['idUser'] = idUser;
    data['token'] = token;
    data['idDevice'] = idDevice;
    return data;
  }
}