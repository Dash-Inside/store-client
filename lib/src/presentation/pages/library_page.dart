import 'package:flutter/material.dart';
import 'package:store_client/src/presentation/widgets/expantiontile_widget.dart';
import 'package:store_client/src/presentation/widgets/navigation_bar_widget.dart';

class LibraryPage extends StatelessWidget {
  static const double fontSize = 28.0;
  static const double fontLetterSpacing = 0.5;
  static const double iconSize = 24.0;
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colorSurf = colorScheme.surface;
    final colorSec = colorScheme.secondary;
    final colorTet = colorScheme.tertiary;

    return Scaffold(
      backgroundColor: colorSurf,
      appBar: AppBar(
        shadowColor: colorTet,
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
            onPressed: () {},
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
            child: ListView(
              children: [
                ExpantionTileWidget(title: 'Selection 1'),
                ExpantionTileWidget(title: 'Selection 2'),
                ExpantionTileWidget(title: 'Selection 3'),
                ExpantionTileWidget(title: 'Selection 4'),
                ExpantionTileWidget(title: 'Selection 5'),
                ExpantionTileWidget(title: 'Selection 6'),
                ExpantionTileWidget(title: 'Selection 7'),
                ExpantionTileWidget(title: 'Selection 8'),
                ExpantionTileWidget(title: 'Selection 9'),
                ExpantionTileWidget(title: 'Selection 10'),
              ],
            ),
          ),
          NavigationBarWidget(),
        ],
      ),
    );
  }
}
