class User {

  final int id;
  final String username;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String password;

  const User ({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.password,

  });

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'fullName': fullName,
      'username': username,
      'phone': phone,
      'address': address,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{ '
        'id: $id, '
        'fullName: $fullName, '
        'username: $username, '
        'email: $email, '
        'phone: $phone, '
        'address: $address, '
        'password: $password}';
  }
}