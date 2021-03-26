import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/app/app.dart';
import 'package:spectrum_library/database/hive/database_helper.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/screen/book_detail.dart';
import 'package:spectrum_library/services/services.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          FutureBuilder<List<BookDetails>>(
              future: Provider.of<DatabaseHelper>(context).getallbooks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var bookDetails = snapshot.data;
                  return bookDetails?.length != 0
                      ? Expanded(
                          child: GridView.builder(
                            itemCount: bookDetails.length ?? 0,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 3 / 4,
                            ),
                            itemBuilder: (context, index) {
                              String accesscode = context
                                  .watch<DatabaseHelper>()
                                  .getuser()
                                  .access_code;
                              String frontcover =
                                  bookDetails.elementAt(index).front_cover;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: BookCard(
                                  imageUrl:
                                      '${Constants.domainNameUrl}${frontcover}',
                                  filename:
                                      bookDetails.elementAt(index).book_title,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookDetail(
                                          bookDetails: context
                                              .watch<DatabaseHelper>()
                                              .getsinglebooks(
                                                  bookid: bookDetails
                                                      .elementAt(index)
                                                      .book_id),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Constants.primaryColor),
                          ),
                        );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Constants.primaryColor),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final Function onTap;
  final String filename;

  BookCard({this.imageUrl, this.onTap, this.filename});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2.7;
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Constants.primaryColor),
                          semanticsLabel: 'Loading Image...',
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: Text(
        //         filename,
        //         textAlign: TextAlign.center,
        //         style: AppTextStyles.h3style.copyWith(fontSize: 10),
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
