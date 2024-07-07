class UserDetail {
  final String fullname;
  final String email;
  final String mobileno;

  const UserDetail({
    required this.email,
    required this.fullname,
    required this.mobileno,
  });

  toJson() {
    return {
      "Full Name": fullname,
      "Email Id": email,
      "mobile no.": mobileno,
    };
  }
}
