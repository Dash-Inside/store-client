import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/entities/user.dart';
import 'package:store_client/src/presentation/bloc/messenger/messenger_bloc.dart';
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

  final MessengerBloc messengerBloc;

  ChatPage({
    required this.messengerBloc,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurf = colorScheme.surface;
    final Color colorSec = colorScheme.secondary;
    final Color colorPr = colorScheme.primary;
    final Color colorTet = colorScheme.tertiary;

    void backOnPressed() => Navigator.of(context).pushNamed('/library');

    void sendOnPressed() {
      messengerBloc.add(SendMessengerEvent(message: textEditingController.text));
    }

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
      body: BlocBuilder<MessengerBloc, MessengerState>(
        bloc: messengerBloc,
        builder: (context, state) {
          switch (state) {
            case EmptyMessengerState():
              return Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text('no messeges'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(textFieldPadding),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            controller: textEditingController,
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
              );
            case DataMessengerState():
              final List<Message> messages = (state).messages;
              final User me = (state).me;
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final int senderId = messages[index].senderId;

                          if (index == 0) {
                            if (senderId == me.id) {
                              return OutcomingMessageWidget(
                                text: messages[index].data,
                              );
                            }

                            if (senderId != me.id) {
                              return IncomingMessageWidget(
                                text: messages[index].data,
                              );
                            }
                          } else {
                            final int messageListIndexOne = messages[index - 1].senderId;
                            if (senderId != messageListIndexOne && senderId != me.id) {
                              return IncomingMessageWidget(
                                text: messages[index].data,
                              );
                            }
                            if (senderId == messageListIndexOne && senderId != me.id) {
                              return NoAvatarIncomingMessageWidget(
                                text: messages[index].data,
                              );
                            }
                            if (senderId == me.id) {
                              return OutcomingMessageWidget(
                                text: messages[index].data,
                              );
                            }
                          }

                          return Center(
                            child: CircularProgressIndicator(),
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
                              controller: textEditingController,
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
              );
          }
        },
      ),
    );
  }
}
