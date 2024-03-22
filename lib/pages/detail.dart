import 'package:flutter/material.dart';
import 'package:latihan_kuis/models/tourism_place.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace place;

  const DetailPage({super.key, required this.place});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // actions: [TextButton(onPressed: () {}, child: Icon(Icons.menu))],
          title: Text(widget.place.name),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            _imageContainer(context),
            _detailContainer(context)
            // _tourismListMenu(context),
            // const SizedBox(height: 20)
          ]),
        ),
      ),
    );
  }

  Widget _imageContainer(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 180,
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) =>
                Image.network(widget.place.imageUrls[index])),
      ),
    );
  }

  Widget _detailContainer(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.place.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.place.location,
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(148, 0, 0, 0)),
            ),
            const SizedBox(height: 16),
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.place.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.calendar_month_rounded, size: 32),
                      const SizedBox(height: 4),
                      Text(widget.place.openDays,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.access_time_rounded, size: 32),
                      const SizedBox(height: 4),
                      Text(widget.place.openTime,
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Icon(Icons.discount_outlined, size: 32),
                      const SizedBox(height: 4),
                      Text(widget.place.ticketPrice,
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
