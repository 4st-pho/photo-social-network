import 'package:photo_social_network/data/models/message.dart';

class Room {
  List<String> ids;
  List<String> imagesPath;
  List<String> names;
  List<Message> messages;

  Room({
    this.ids = const [],
    this.imagesPath = const [],
    this.names = const [],
    required this.messages,
  });

  Message get lastMessage => messages.last;

  String myAvatar({required String myId}) {
    final index = ids.indexWhere((e) => e == myId);
    if (index == 0) {
      return imagesPath.first;
    }
    return imagesPath.last;
  }

  String friendAvatar({required String myId}) {
    final index = ids.indexWhere((e) => e == myId);
    if (index == 0) {
      return imagesPath.last;
    }
    return imagesPath.first;
  }

  String friendname({required String myId}) {
    final index = ids.indexWhere((e) => e == myId);
    if (index == 0) {
      return names.last;
    }
    return names.first;
  }
}
