import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:midterm_a201_stiw2044/book.dart';

class DetailScreen extends StatefulWidget {
  final Book book;

  const DetailScreen({Key key, this.book}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double screenHeight = 0.00, screenWidth = 0.00;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // title: 'Material App',
      // home: Scaffold(
      appBar: AppBar(
        title: Text(widget.book.booktitle),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text("hai"),
                Container(
                    height: screenHeight / 2.5,
                    width: screenWidth / 0.5,
                    child: SingleChildScrollView(
                      child: CachedNetworkImage(
                        imageUrl:
                            "http://slumberjer.com/bookdepo/bookcover/${widget.book.cover}.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(
                          Icons.broken_image,
                          size: screenWidth / 2,
                        ),
                      ),
                    )),
                Divider(color: Colors.grey),
                Text('Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 5),
                Text(widget.book.description),
                Divider(color: Colors.grey),
                Container(
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Type',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Details',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("Book Title")),
                          DataCell(Text(widget.book.booktitle)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("Author")),
                          DataCell(Text(widget.book.author)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("Price")),
                          DataCell(Text("RM " + widget.book.price)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("ISBN")),
                          DataCell(Text(widget.book.isbn)),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("Publisher")),
                          DataCell(Text(widget.book.publisher)),
                        ],
                      ),
                      // DataRow(
                      //   cells: <DataCell>[
                      //     DataCell(Text("Description")),
                      //     DataCell(Text(widget.book.description)),
                      //   ],
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
