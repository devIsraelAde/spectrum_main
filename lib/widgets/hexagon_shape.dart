import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:spectrum_library/services/services.dart';

class HexagonShape extends StatelessWidget {
  final Function onPressBackArrow;
  final String imageUrl;

  HexagonShape(this.onPressBackArrow, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Color(0xff054D44),
            height: 150.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: onPressBackArrow,
                  ),
/*                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),*/
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: HexagonalClipper(reverse: true),
            child: Container(
              height: height * .40,
              decoration: BoxDecoration(
                color: Color(0xff054D44),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.only(top: 150.0, bottom: 10.0),
            decoration: BoxDecoration(
              // color: Colors.white,
              border: Border.all(color: Color(0xff054D44), width: 2),
              boxShadow: [Constants.kBoxShadow],
              borderRadius: BorderRadius.circular(13.0),
            ),
            width: 150.0,
            height: 199.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              //  Image(
              //   image: NetworkImage(
              //     imageUrl,
              //   ),
              //   width: 150.0,
              //   height: 200.0,
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
