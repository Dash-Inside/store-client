import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/presentation/widgets/expantiontile_widget.dart';
import 'package:store_client/src/presentation/widgets/navigation_bar_widget.dart';

@Injectable()
class LibraryPage extends StatelessWidget {
  static const double fontSize = 28.0;
  static const double fontLetterSpacing = 0.5;
  static const double iconSize = 24.0;
  final List<String> sectionList = [
    'Section 1',
    'Section 2',
    'Section 3',
    'Section 4',
    'Section 5',
  ];
  final List<String> topicList = [
    'Topic #1',
    'Topic #2',
    'Topic #3',
    'Topic #4',
    'Topic #5',
  ];

  LibraryPage();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurf = colorScheme.surface;
    final Color colorSec = colorScheme.secondary;
    void searchOnPressed() {}

    return Scaffold(
      backgroundColor: colorSurf,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorSurf,
        automaticallyImplyLeading: false,
        title: Text(
          'Library',
          style: TextStyle(
            height: 1.0,
            fontSize: fontSize,
            letterSpacing: fontLetterSpacing,
            fontWeight: FontWeight.w500,
            color: colorSec,
          ),
        ),
        actions: [
          IconButton(
            onPressed: searchOnPressed,
            icon: Icon(
              Icons.search_rounded,
              size: iconSize,
              color: colorSec,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sectionList.length,
              itemBuilder: (context, index) {
                return ExpantionTileWidget(
                  title: sectionList[index],
                  topicList: topicList,
                );
              },
            ),
          ),
          NavigationBarWidget(),
        ],
      ),
    );
  }
}
