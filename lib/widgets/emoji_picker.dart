import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';
import 'package:whatsapp_clone_flutter/core/network/client_http.dart';
import 'package:whatsapp_clone_flutter/models/emoji_model.dart';
import 'package:whatsapp_clone_flutter/widgets/svg_icon.dart';

class EmojiPicker extends StatelessWidget {
  final Function(String) onEmojiSelected;
  final VoidCallback onBackPressed;

  const EmojiPicker({Key? key, required this.onEmojiSelected, required this.onBackPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<EmojiCategory>> _getEmojis() async {
      final client = getIt<Http>();

      final emojis = await client.response<List<EmojiCategory>>(
        url: '/emojis',
        mapper: (json) {
          final List<EmojiCategory> data = [];

          json.forEach((key, value) {
            data.add(EmojiCategory.fromJson(key, value));
          });

          return data;
        },
      );

      return emojis ?? [];
    }

    return Container(
      height: 300,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: FutureBuilder<List<EmojiCategory>>(
        future: _getEmojis(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data!;

            return DefaultTabController(
              length: categories.length,
              child: Column(
                children: [
                  TabBar(
                    labelPadding: EdgeInsets.zero,
                    tabs: List.generate(
                      categories.length,
                      (index) => Tab(
                        icon: SvgIcon(
                          icon: categories[index].icon,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: categories
                          .map((category) => _GridEmojis(
                                emojis: category.emojis,
                                onSelected: onEmojiSelected,
                              ))
                          .toList(),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => {},
                        ),
                        const Spacer(),
                        const SvgIcon(icon: SvgIcons.smile),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.backspace_outlined),
                          onPressed: onBackPressed,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}

class _GridEmojis extends StatelessWidget {
  final List<Emoji> emojis;
  final Function(String) onSelected;

  const _GridEmojis({Key? key, required this.emojis, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: emojis.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemBuilder: (_, index) {
        return GestureDetector(
          child: Center(
            child: Text(
              emojis[index].emoji,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          onTap: () => onSelected(emojis[index].emoji),
        );
      },
    );
  }
}
