class ChatOverview{
  String title;
  String subTitle;
  bool hasNewMessage;
  String avatar;

  ChatOverview({
    required this.title,
    required this. subTitle,
    required this.hasNewMessage,
    required this.avatar
});


}
List<ChatOverview> demoChatList= [
  ChatOverview(title: 'Faizan Ahmad', subTitle: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', hasNewMessage: true, avatar: 'assets/images/profile_img.png'),
  ChatOverview(title: 'Alpha Name', subTitle: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', hasNewMessage: true, avatar: 'assets/images/profile_img.png'),
  ChatOverview(title: 'Some Other', subTitle: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', hasNewMessage: true, avatar: 'assets/images/profile_img.png'),
  ChatOverview(title: 'The Shop', subTitle: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', hasNewMessage: true, avatar: 'assets/images/profile_img.png'),
];