import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class UserResponse {
  UserResponse({
    this.results,
    this.info,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final List<Results>? results = json['results'] is List ? <Results>[] : null;
    if (results != null) {
      for (final dynamic item in json['results']!) {
        if (item != null) {
          results.add(Results.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return UserResponse(
      results: results,
      info: json['info'] == null
          ? null
          : Info.fromJson(asT<Map<String, dynamic>>(json['info'])!),
    );
  }

  List<Results>? results;
  Info? info;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'results': results,
    'info': info,
  };
}

class Results {
  Results({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    gender: asT<String?>(json['gender']),
    name: json['name'] == null
        ? null
        : Name.fromJson(asT<Map<String, dynamic>>(json['name'])!),
    location: json['location'] == null
        ? null
        : Location.fromJson(asT<Map<String, dynamic>>(json['location'])!),
    email: asT<String?>(json['email']),
    login: json['login'] == null
        ? null
        : Login.fromJson(asT<Map<String, dynamic>>(json['login'])!),
    dob: json['dob'] == null
        ? null
        : Dob.fromJson(asT<Map<String, dynamic>>(json['dob'])!),
    registered: json['registered'] == null
        ? null
        : Registered.fromJson(
        asT<Map<String, dynamic>>(json['registered'])!),
    phone: asT<String?>(json['phone']),
    cell: asT<String?>(json['cell']),
    id: json['id'] == null
        ? null
        : Id.fromJson(asT<Map<String, dynamic>>(json['id'])!),
    picture: json['picture'] == null
        ? null
        : Picture.fromJson(asT<Map<String, dynamic>>(json['picture'])!),
    nat: asT<String?>(json['nat']),
  );

  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Registered? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gender': gender,
    'name': name,
    'location': location,
    'email': email,
    'login': login,
    'dob': dob,
    'registered': registered,
    'phone': phone,
    'cell': cell,
    'id': id,
    'picture': picture,
    'nat': nat,
  };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: asT<String?>(json['title']),
    first: asT<String?>(json['first']),
    last: asT<String?>(json['last']),
  );

  String? title;
  String? first;
  String? last;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'title': title,
    'first': first,
    'last': last,
  };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: json['street'] == null
        ? null
        : Street.fromJson(asT<Map<String, dynamic>>(json['street'])!),
    city: asT<String?>(json['city']),
    state: asT<String?>(json['state']),
    country: asT<String?>(json['country']),
    postcode: asT<int?>(json['postcode']),
    coordinates: json['coordinates'] == null
        ? null
        : Coordinates.fromJson(
        asT<Map<String, dynamic>>(json['coordinates'])!),
    timezone: json['timezone'] == null
        ? null
        : Timezone.fromJson(asT<Map<String, dynamic>>(json['timezone'])!),
  );

  Street? street;
  String? city;
  String? state;
  String? country;
  int? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'street': street,
    'city': city,
    'state': state,
    'country': country,
    'postcode': postcode,
    'coordinates': coordinates,
    'timezone': timezone,
  };
}

class Street {
  Street({
    this.number,
    this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
    number: asT<int?>(json['number']),
    name: asT<String?>(json['name']),
  );

  int? number;
  String? name;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'number': number,
    'name': name,
  };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: asT<String?>(json['latitude']),
    longitude: asT<String?>(json['longitude']),
  );

  String? latitude;
  String? longitude;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'latitude': latitude,
    'longitude': longitude,
  };
}

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    offset: asT<String?>(json['offset']),
    description: asT<String?>(json['description']),
  );

  String? offset;
  String? description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'offset': offset,
    'description': description,
  };
}

class Login {
  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    uuid: asT<String?>(json['uuid']),
    username: asT<String?>(json['username']),
    password: asT<String?>(json['password']),
    salt: asT<String?>(json['salt']),
    md5: asT<String?>(json['md5']),
    sha1: asT<String?>(json['sha1']),
    sha256: asT<String?>(json['sha256']),
  );

  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uuid': uuid,
    'username': username,
    'password': password,
    'salt': salt,
    'md5': md5,
    'sha1': sha1,
    'sha256': sha256,
  };
}

class Dob {
  Dob({
    this.date,
    this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    date: asT<String?>(json['date']),
    age: asT<int?>(json['age']),
  );

  String? date;
  int? age;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'date': date,
    'age': age,
  };
}

class Registered {
  Registered({
    this.date,
    this.age,
  });

  factory Registered.fromJson(Map<String, dynamic> json) => Registered(
    date: asT<String?>(json['date']),
    age: asT<int?>(json['age']),
  );

  String? date;
  int? age;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'date': date,
    'age': age,
  };
}

class Id {
  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    name: asT<String?>(json['name']),
    value: asT<Object?>(json['value']),
  );

  String? name;
  Object? value;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'value': value,
  };
}

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: asT<String?>(json['large']),
    medium: asT<String?>(json['medium']),
    thumbnail: asT<String?>(json['thumbnail']),
  );

  String? large;
  String? medium;
  String? thumbnail;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'large': large,
    'medium': medium,
    'thumbnail': thumbnail,
  };
}

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: asT<String?>(json['seed']),
    results: asT<int?>(json['results']),
    page: asT<int?>(json['page']),
    version: asT<String?>(json['version']),
  );

  String? seed;
  int? results;
  int? page;
  String? version;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'seed': seed,
    'results': results,
    'page': page,
    'version': version,
  };
}
