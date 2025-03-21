import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_for_olimp/presentation/one_new.dart';
import 'package:news_app_for_olimp/providers.dart';

class NewsMainScreen extends ConsumerWidget {
  const NewsMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsData = ref.watch(newsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  return newsData.when(
                    data: (newOne) {
                      if (newOne.isNotEmpty) {
                        return ListView.builder(
                          itemCount: newOne.length,
                          itemBuilder: (context, index) {
                            final newUi = newOne[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => OneNew(
                                          content: newUi.content,
                                          urlToImage:
                                              newUi.urlToImage ??
                                              'https://37s.musify.club/img/69/8905698/23854359.jpg',
                                          title: newUi.title,
                                        ),
                                  ),
                                );
                              },
                              child: Card(
                                child: ListTile(
                                  title: Text(newUi.title),
                                  minLeadingWidth: 50,
                                  subtitle: Text(
                                    newUi.description,
                                    maxLines: 2,
                                  ),
                                  leading: Image.network(
                                    newUi.urlToImage ??
                                        'https://37s.musify.club/img/69/8905698/23854359.jpg',

                                    height: 60,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('No news'));
                      }
                    },
                    error:
                        (error, stackTrace) => Center(
                          child: Center(
                            child: Text('Some problems with connection'),
                          ),
                        ),
                    loading:
                        () => Center(
                          child: CircularProgressIndicator(
                            color: Colors.blueAccent,
                          ),
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
