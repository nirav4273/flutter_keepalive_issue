import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: Home(),
    theme: ThemeData(primaryColor: Colors.white),
  ));
}

class Home extends StatefulWidget {
  createState() => HomeState();
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  int activePage = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activePage = 0;
    });
  }

  goToNext(img) {
//    Navigator.push(context,MaterialPageRoute(builder: (context)=>Detail(image: img)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Icon(Icons.search),
          )
        ],
        title: Text("Theme"),
      ),
      body: ListView(
        addAutomaticKeepAlives: true,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
              height: 200.0,
              child: PageView.builder(
                onPageChanged: (num) {
                  print("Page $num");
                  setState(() {
                    activePage = num;
                  });
                },
                controller: PageController(viewportFraction: 0.85),
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            goToNext("images/${index + 1}.jpg");
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              padding: EdgeInsets.all(
                                  activePage == index ? 1.0 : 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: activePage == index
                                        ? [
                                            BoxShadow(
                                              color: Colors.black38,
//                                    spreadRadius: 1.0,
                                              blurRadius: 8.0,
                                            )
                                          ]
                                        : []),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      "images/${index + 1}.jpg",
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Text(
                          "Image overlay Te Image dads Image overlay Te Image dads Image overlay Te Image dads  overlay Text $index",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        alignment: Alignment(-0.8, 0.6),
                      ),
                    ],
                  );
                },
                itemCount: 10,
              )),
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 75.0,
            child: ListView.builder(
              addAutomaticKeepAlives: true,
              itemBuilder: (context, index) {
                return InkResponse(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 10.0, top: 5.0, bottom: 5.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            child: Container(
                              width: 150.0,
                              height: 70.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.redAccent[100]
                                          .withOpacity(0.6),
                                      blurRadius: 6.0,
                                    )
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("images/36.jpg"),
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                          Colors.redAccent.withOpacity(0.5),
                                          BlendMode.color)),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                "BUtton $index",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                        )));
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
              height: 50.0,
              child: ListTile(
                leading: Text(
                  "My Set",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
              )),
          Container(
              height: 170.0,
              padding: EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ImageSliver(AssetImage(
                    "images/${index + 1}.jpg",
                  ));
                },
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                addAutomaticKeepAlives: true,
              )),
          Container(
              height: 50.0,
              child: ListTile(
                leading: Text(
                  "Popular on Netflix ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                ),
              )),
          Container(
              height: 170.0,
              padding: EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ImageSliver(AssetImage(
                    "images/${index + 1}.jpg",
                  ));
                },
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                addAutomaticKeepAlives: true,
                cacheExtent: 1000.0,
              ))
        ],
      ),
    );
  }
}

/*
* Padding(
  padding: EdgeInsets.only(right: 15.0,top: 10.0,bottom: 10.0),
  child:Container(
    width: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.black12,
        image: DecorationImage(image: AssetImage("images/${index+1}.jpg",),fit: BoxFit.cover),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black38,
          )
        ]
    ),
  )
  )
* */

class ImageSliver extends StatefulWidget {
  ImageSliver(this.image);

  final AssetImage image;

  @override
  _ImageSliverState createState() => _ImageSliverState();
}

class _ImageSliverState extends State<ImageSliver> with AutomaticKeepAliveClientMixin<ImageSliver> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @mustCallSuper
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.only(right: 15.0, top: 10.0, bottom: 10.0),
        child: Container(
          width: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black12,
              image: DecorationImage(image: widget.image, fit: BoxFit.cover),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Colors.black38,
                )
              ]),
        ));
  }
}
