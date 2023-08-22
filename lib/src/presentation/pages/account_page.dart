import 'package:flutter/material.dart';
import 'package:store_client/src/presentation/widgets/navigation_bar_widget.dart';
import 'package:store_client/src/presentation/widgets/topic_widget.dart';

class AccountPage extends StatelessWidget {
  static const double editIconButtonSize = 16.0;
  static const double widthSizedBox2 = 16.0;
  static const double fontSizeHeaders = 28.0;
  static const double widthSizedBox = 32.0;
  static const double fontSizeBody = 24.0;
  static const double fontSizeThin = 16.0;
  static const double avatarRadius = 34.0;
  static const double edgeInsetsMargin = 16.0;
  static const double roleHeight = 0.8;
  final List<String> listTopics = [
    'Topic #1',
    'Topic #2',
    'Topic #3',
    'Topic #4',
    'Topic #5',
    'Topic #6',
  ];

  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurface = colorScheme.surface;
    final Color colorSecondary = colorScheme.secondary;
    final Color colorPrimary = colorScheme.primary;
    void editOnPressed() {}
    void photoOnPressed() {}
    void topicOnPressed() {}

    return Scaffold(
      backgroundColor: colorSurface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorSurface,
        elevation: 0.0,
        title: Text(
          'Account',
          style: TextStyle(
            color: colorSecondary,
            fontSize: fontSizeHeaders,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(edgeInsetsMargin),
            child: Row(
              children: [
                CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: colorPrimary,
                  child: IconButton(
                    onPressed: photoOnPressed,
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: colorSecondary,
                    ),
                  ),
                ),
                SizedBox(
                  width: widthSizedBox2,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              height: 1.0,
                              fontSize: fontSizeBody,
                              fontWeight: FontWeight.w400,
                              color: colorSecondary,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: editOnPressed,
                            icon: Icon(
                              Icons.mode_edit_outline_outlined,
                              size: editIconButtonSize,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Role',
                        style: TextStyle(
                          height: roleHeight,
                          fontSize: fontSizeThin,
                          fontWeight: FontWeight.w300,
                          color: colorSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: widthSizedBox,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: fontSizeBody,
                    fontWeight: FontWeight.w400,
                    color: colorSecondary,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: listTopics.length,
                itemBuilder: (context, index) {
                  return TopicWidget(
                    text: listTopics[index],
                    topicOnPressed: topicOnPressed,
                  );
                },
              ),
            ),
          ),
          NavigationBarWidget(),
        ],
      ),
    );
  }
}
