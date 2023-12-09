class ProfileModel {
  Data? data;
  Null? message;
  String? next;
  Error? error;

  ProfileModel({this.data, this.message, this.next, this.error});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    // message = json['message'];
    // next = json['next'];
    // error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['next'] = this.next;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  Null? email;
  int? countryId;
  int? gender;
  String? birthDate;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? mobile;
  Null? callNumber;
  Null? address;
  List<SocialMedia>? socialMedia;
  bool? isBehandam3User;
  bool? hasFitaminService;
  Null? media;
  int? remainingCallNum;
  bool? hasCall;

  Data(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.countryId,
      this.gender,
      this.birthDate,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mobile,
      this.callNumber,
      this.address,
      this.socialMedia,
      this.isBehandam3User,
      this.hasFitaminService,
      this.media,
      this.remainingCallNum,
      this.hasCall});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryId = json['country_id'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    mobile = json['mobile'];
    callNumber = json['call_number'];
    address = json['address'];
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(new SocialMedia.fromJson(v));
      });
    }
    isBehandam3User = json['is_behandam3_user'];
    hasFitaminService = json['has_fitamin_service'];
    media = json['media'];
    remainingCallNum = json['remaining_call_num'];
    hasCall = json['has_call'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_id'] = this.countryId;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['mobile'] = this.mobile;
    data['call_number'] = this.callNumber;
    data['address'] = this.address;
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.map((v) => v.toJson()).toList();
    }
    data['is_behandam3_user'] = this.isBehandam3User;
    data['has_fitamin_service'] = this.hasFitaminService;
    data['media'] = this.media;
    data['remaining_call_num'] = this.remainingCallNum;
    data['has_call'] = this.hasCall;
    return data;
  }
}

class SocialMedia {
  int? id;
  String? name;
  Pivot? pivot;

  SocialMedia({this.id, this.name, this.pivot});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? socialMediaId;
  Null? link;

  Pivot({this.userId, this.socialMediaId, this.link});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    socialMediaId = json['social_media_id'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['social_media_id'] = this.socialMediaId;
    data['link'] = this.link;
    return data;
  }
}

class Error {
  Null? message;
  Null? errors;

  Error({this.message, this.errors});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['errors'] = this.errors;
    return data;
  }
}
