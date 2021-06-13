import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled/views/example.dart';

class NewsCard extends StatefulWidget {
  String title, desc, imgURL, url;

  NewsCard(
      {Key? key,
      this.title = "",
      this.desc = "",
      this.imgURL = "",
      this.url = ""})
      : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double relative = MediaQuery.of(context).size.height;
    // var h = relative*0.4;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: null,
                child: ClipRRect(
                  child: Image.asset(
                    "lib/assets/${widget.imgURL}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: relative,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: relative / 50,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: relative,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  widget.desc,
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: relative / 50,
                  ),
                ),
              ),
            ],
          ),
          // Spacer(),
          InkWell(
            onTap: () async {
              String url = widget.url;
              if (await canLaunch(url))
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/${widget.imgURL}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: Text(
                          "Tap here to read more",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
