import 'package:flutter/material.dart';

void main() {
  runApp(const TweeterPage());
}

class TweeterPage extends StatelessWidget {
  const TweeterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Twitter Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const TwitterPage());
  }
}

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Twitter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          // Barre de navigation supérieur
          const TopNavigationTwitter(),
          // Formulaire de Connexion

          // Le reste de la page avec la liste des tweet
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const TweetWithButtons())),
        ],
      ),
      // Barre de navigation basse
      bottomNavigationBar: const BottomNavigationTwitter(),
    );
  }
}


class TweetWithButtons extends StatelessWidget {
  const TweetWithButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Tweet(DateTime(2023, 12, 3, 12, 50, 12)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonTweetBar(),
          )
        ],
      ),
    );
  }
}

class Tweet extends StatelessWidget {
  final DateTime dateTime;

  Tweet(
      this.dateTime, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.network(
        "https://picsum.photos/150",
        width: 125,
        height: 125,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("LaCrevette@Chocolate",
                      style: Theme.of(context).textTheme.titleSmall),
                  Text(
                    "${dateTime.minute}m",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "latine euismod nulla mauris corrumpit scripserit unum causae justo"
                      " pellentesque scripta justo ius elitr orci")
            ],
          ),
        ),
      )
    ]);
  }
}

class ButtonTweetBar extends StatefulWidget {
  const ButtonTweetBar({
    super.key,
  });

  @override
  State<ButtonTweetBar> createState() => _ButtonTweetBarState();
}

class _ButtonTweetBarState extends State<ButtonTweetBar> {
  var isLiked = false;
  var isRetweet = false;
  var isReply = false;

  void _changeTweet() {
    setState(() {
      isRetweet = !isRetweet;
    });
  }

  void _changeReply() {
    setState(() {
      isReply = !isReply;
    });
  }

  void _changeLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: isReply ? const Icon(Icons.reply) : const Icon(Icons.reply_rounded),
          onPressed: _changeReply,
          color: isReply ? Colors.blue : Colors.black,
        ),
        IconButton(
          icon: isRetweet ? const Icon(Icons.repeat_one) : const Icon(Icons.repeat),
          onPressed: _changeTweet,
          color: isRetweet ? Colors.blue : Colors.black,
        ),
        IconButton(
          icon: isLiked
              ? const Icon(
            Icons.favorite,
            color: Colors.red,
          )
              : const Icon(Icons.favorite_outline, color: Colors.black),
          onPressed: _changeLike,
        ),
      ],
    );
  }
}

class TopNavigationTwitter extends StatelessWidget {
  const TopNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0xFF, 0x58, 0xB0, 0xF0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {},
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Accueil",
                  style: TextStyle(color: Colors.white),
                )),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationTwitter extends StatelessWidget {
  const BottomNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "Fil",
              style: TextStyle(color: Colors.blue),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Notification",
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Messages",
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Moi",
              style: TextStyle(color: Colors.grey),
            )),
      ],
    );
  }
}
