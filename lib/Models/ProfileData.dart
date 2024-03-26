class ProfileData {
  String image;
  String name;
  String email;
  String phoneNumber;

  ProfileData({required this.name, required this.email, required this.phoneNumber, this.image = 'assets/images/intro_slider_img1.png'});
}

ProfileData demoProfileData = ProfileData(name: 'John Doe', email: 'johndoe@gmail.com', phoneNumber: '03030752535');