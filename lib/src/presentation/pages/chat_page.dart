import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/presentation/widgets/incoming_message_widget.dart';
import 'package:store_client/src/presentation/widgets/no_avatar_incoming_message_widget.dart';
import 'package:store_client/src/presentation/widgets/outcoming_message_widget.dart';
import 'package:store_client/src/presentation/widgets/text_field_widget.dart';

@Injectable()
class ChatPage extends StatelessWidget {
  static const double fontSize = 28.0;
  static const double fontLetterSpacing = 0.5;
  static const double iconSize = 24.0;
  static const double textFieldPadding = 8.0;
  final int ourId = 3;
  final List<Message> messageList = [
    Message(id: 1, data: "123", senderId: 4),
    Message(id: 2, data: "ghbgt", senderId: 4),
    Message(id: 3, data: "ytrt", senderId: 3),
    Message(id: 2, data: "ghbgt", senderId: 4),
    Message(id: 3, data: "ytrt", senderId: 3),
    Message(id: 3, data: "ytrt", senderId: 3),
    Message(id: 3, data: "ytrt", senderId: 3),
    Message(id: 2, data: "ghbgt", senderId: 4),
    Message(id: 2, data: "ghbgt", senderId: 4),
    Message(id: 2, data: "ghbgt", senderId: 4),
  ].reversed.toList();

  ChatPage();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurf = colorScheme.surface;
    final Color colorSec = colorScheme.secondary;
    final Color colorPr = colorScheme.primary;
    final Color colorTet = colorScheme.tertiary;
    void backOnPressed() => Navigator.of(context).pushNamed('/library');
    void sendOnPressed() {}

    return Scaffold(
      backgroundColor: colorSurf,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorSurf,
        centerTitle: false,
        title: Text(
          'Chat',
          style: TextStyle(
            height: 1.0,
            fontSize: fontSize,
            letterSpacing: fontLetterSpacing,
            fontWeight: FontWeight.w500,
            color: colorSec,
          ),
        ),
        leading: IconButton(
          onPressed: backOnPressed,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorSec,
            size: iconSize,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messageList.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final int messageListIndex = messageList[index].senderId;

                  if (index == 0) {
                    if (messageListIndex == ourId) {
                      return OutcomingMessageWidget(
                        text: messageList[index].data,
                      );
                    }

                    if (messageListIndex != ourId) {
                      return IncomingMessageWidget(
                        text: messageList[index].data,
                      );
                    }
                  } else {
                    final int messageListIndexOne = messageList[index - 1].senderId;
                    if (messageListIndex != messageListIndexOne && messageListIndex != ourId) {
                      return IncomingMessageWidget(
                        text: messageList[index].data,
                      );
                    }
                    if (messageListIndex == messageListIndexOne && messageListIndex != ourId) {
                      return NoAvatarIncomingMessageWidget(
                        text: messageList[index].data,
                      );
                    }
                    if (messageListIndex == ourId) {
                      return OutcomingMessageWidget(
                        text: messageList[index].data,
                      );
                    }
                  }

                  return Center(
                    child: Text('Check internet connection'),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(textFieldPadding),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: TextEditingController(),
                      hintText: 'Message',
                    ),
                  ),
                  IconButton(
                    hoverColor: colorTet,
                    onPressed: sendOnPressed,
                    icon: Icon(
                      Icons.send,
                      color: colorPr,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
