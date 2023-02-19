class UserModel {
  final String id;
  final String fullname;
  final String avatar;
  final String username;
  final String address;
  final List<String> folower;
  UserModel({
    this.id = '',
    this.fullname = '',
    this.avatar = '',
    this.username = '',
    this.address = '',
    this.folower = const [],
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullname': fullname,
      'avater': avatar,
      'username': username,
      'address': address,
      'folower': folower,
      'id': id,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullname: json['fullname'] ?? '',
      avatar: json['avater'] ?? '',
      username: json['username'] ?? '',
      address: json['address'] ?? '',
      folower: json['folower'] ?? [],
    );
  }
}
