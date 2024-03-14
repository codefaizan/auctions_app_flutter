enum ChatMessageType {text, attachment}

class ChatMessage{
  final String text;
  final ChatMessageType messageType;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.messageType,
    required this.isSender
  });
}

List<ChatMessage> demoMessages = [
  ChatMessage(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', messageType: ChatMessageType.text, isSender: false),
  ChatMessage(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', messageType: ChatMessageType.text, isSender: true),
  ChatMessage(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum.', messageType: ChatMessageType.text, isSender: false),
  ChatMessage(text: 'Lorem ipsum dolor sit amet. Sit architecto possimus et possimus corporis cum. Qui porro magni est internos molestias sit aperiam pariatur id dicta laboriosam qui adipisci totam nam amet quisquam ea ipsum dolorem. ', messageType: ChatMessageType.text, isSender: true),
];

