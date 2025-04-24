// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:openlib/ui/components/page_title_widget.dart';
import 'package:openlib/ui/components/snack_bar_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const version = "1.0.11";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("Openlib"),
        titleTextStyle: Theme.of(context).textTheme.displayLarge,
      ),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText("About"),
              const Padding(
                padding:
                    EdgeInsets.only(left: 7, right: 7, top: 13, bottom: 10),
                child: Text(
                  "OpenLib is a Flutter-based app built by book lovers to make discovering your next read easy and enjoyable. With smart search, personalized recommendations, and a clean interface, OpenLib helps you explore books you’ll love—seamlessly on both Android and iOS. Happy reading!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.only(left: 7, right: 7, top: 10),
                child: Text(
                  "Version",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 7, right: 7, top: 5),
                child: Text(
                  version,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 7, right: 7, top: 10),
                child: Text(
                  "About Developer",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset('assets/dev.PNG'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 7, right: 7, top: 5),
                child: Text(
                  'OpenLib was developed by Rizwan Khan, a passionate Flutter developer with a love for books and clean, user-focused design. Combining his technical skills with a reader’s mindset, Rizwan built OpenLib to help others discover great books with ease.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

class _UrlText extends StatelessWidget {
  const _UrlText({required this.text, required this.url});

  final String url;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            // ignore: use_build_context_synchronously
            showSnackBar(context: context, message: 'Could not launch $uri');
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.launch,
              size: 17,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
