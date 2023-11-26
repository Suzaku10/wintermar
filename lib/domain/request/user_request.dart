class UserRequest {
  final String email;
  final String username;
  final String password;
  final String phoneNumber;

  const UserRequest(this.email, this.username, this.password, this.phoneNumber);

  factory UserRequest.empty() => const UserRequest('', '', '', '');
}
