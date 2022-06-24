class LoginToken {
  String? id;
  String? email;
  String? names;
  String? phone;
  String? state;
  String? selfie;
  String? address;
  int? idState;
  String? province;
  String? surnames;
  bool? videoAuth;
  String? department;
  String? idProvince;
  String? isoLanguage;
  String? numDocument;
  String? prefixPhone;
  String? idDepartment;
  int? idTypeDocument;
  String? documentDescription;
  int? iat;
  int? exp;

  LoginToken(
      {this.id,
      this.email,
      this.names,
      this.phone,
      this.state,
      this.selfie,
      this.address,
      this.idState,
      this.province,
      this.surnames,
      this.videoAuth,
      this.department,
      this.idProvince,
      this.isoLanguage,
      this.numDocument,
      this.prefixPhone,
      this.idDepartment,
      this.idTypeDocument,
      this.documentDescription,
      this.iat,
      this.exp});

  LoginToken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    names = json['names'];
    phone = json['phone'];
    state = json['state'];
    selfie = json['selfie'];
    address = json['address'];
    idState = json['idState'];
    province = json['province'];
    surnames = json['surnames'];
    videoAuth = json['videoAuth'];
    department = json['department'];
    idProvince = json['idProvince'];
    isoLanguage = json['isoLanguage'];
    numDocument = json['numDocument'];
    prefixPhone = json['prefixPhone'];
    idDepartment = json['idDepartment'];
    idTypeDocument = json['idTypeDocument'];
    documentDescription = json['documentDescription'];
    iat = json['iat'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['names'] = names;
    data['phone'] = phone;
    data['state'] = state;
    data['selfie'] = selfie;
    data['address'] = address;
    data['idState'] = idState;
    data['province'] = province;
    data['surnames'] = surnames;
    data['videoAuth'] = videoAuth;
    data['department'] = department;
    data['idProvince'] = idProvince;
    data['isoLanguage'] = isoLanguage;
    data['numDocument'] = numDocument;
    data['prefixPhone'] = prefixPhone;
    data['idDepartment'] = idDepartment;
    data['idTypeDocument'] = idTypeDocument;
    data['documentDescription'] = documentDescription;
    data['iat'] = iat;
    data['exp'] = exp;
    return data;
  }
}