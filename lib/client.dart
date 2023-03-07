import 'dart:convert';

Client clientFRomJson(String src) {
  final jsonData = json.decode(src);
  return Client.fromMap(jsonData);
}

String clientToJson(Client client) {
  final clientMap = client.toMap();
  return json.encode(clientMap);
}

class Client {
  int? id;
  String firstName;
  String? lastName;
  String? email;
  String password;

  Client({
    this.id,
    required this.firstName,
    this.lastName,
    this.email,
    required this.password,
  });

  factory  Client.fromMap(Map<String, dynamic> json) => Client(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic>  toMap() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
  };
}
