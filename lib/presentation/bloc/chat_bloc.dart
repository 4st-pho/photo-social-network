import 'dart:async';

import 'package:photo_social_network/data/models/message.dart';
import 'package:photo_social_network/data/models/room.dart';

class ChatBloc {
  final _roomsController = StreamController<List<Room>>();
  Stream<List<Room>> get roomsDataStream => _roomsController.stream;
  final rooms = [
    Room(
      ids: ['456', '123'],
      names: ['zzz', 'tu'],
      imagesPath: [
        'https://thumbs.dreamstime.com/b/sun-flower-26634556.jpg',
        'https://www.rollingstone.com/wp-content/uploads/2023/02/elon-fires-engineer.jpg?w=1581&h=1054&crop=1',
      ],
      messages: [
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'zz',
          senderId: '456',
        ),
      ],
    ),
    Room(
      ids: ['456', '123'],
      names: ['zzz', 'tu'],
      imagesPath: [
        'https://thumbs.dreamstime.com/b/sun-flower-26634556.jpg',
        'https://www.rollingstone.com/wp-content/uploads/2023/02/elon-fires-engineer.jpg?w=1581&h=1054&crop=1',
      ],
      messages: [
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '456',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '456',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
        Message(
          message: 'hello',
          senderId: '123',
        ),
      ],
    ),
  ];

  ChatBloc() {
    _roomsController.sink.add(rooms);
  }
  void dispose() {
    _roomsController.close();
  }
}
