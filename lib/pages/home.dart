import 'package:flutter/material.dart';
import 'package:latihan_kuis/models/tourism_place.dart';
import 'package:latihan_kuis/pages/detail.dart';
import 'package:latihan_kuis/pages/login.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            _heading(context),
            _tourismListMenu(context),
            const SizedBox(height: 20)
          ]),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20, bottom: 16),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, $username  👋🏻",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text("Welcome to Latihan Quiz Travel.")
              ],
            ),
            _logout(context)
          ],
        ));
  }

  Widget _tourismListMenu(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int count = (width > 840) ? 2 : 1;

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) => _tourismListItem(context, index),
        itemCount: tourismPlaceList.length,
      ),
    );
  }

  Widget _tourismListItem(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: const Color.fromARGB(32, 0, 0, 0)),
          image: DecorationImage(
              image: NetworkImage(tourismPlaceList[index].imageUrls[0]),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  tourismPlaceList[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  tourismPlaceList[index].location,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(128, 0, 0, 0)),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(place: tourismPlaceList[index]),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  child: const Text("Detail"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(66, 124, 124, 124),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      icon: const Icon(Icons.logout),
    );
  }
}
