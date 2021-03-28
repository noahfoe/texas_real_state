import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MyGalleryPage extends StatefulWidget {
  late String email;
  MyGalleryPage({required this.email, Key? key}) : super(key: key);

  @override
  _MyGalleryPageState createState() => _MyGalleryPageState(email: email);
}

class _MyGalleryPageState extends State<MyGalleryPage> {
  late String email;
  _MyGalleryPageState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(
        email: email,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              'Gallery',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            _buildListings(),
          ],
        ),
      ),
    );
  }

  Container _buildListings() {
    return Container(
      height: MediaQuery.of(context).size.height - 130,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text("A new adventure awaits!"),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Image.network("https://tinyurl.com/5hekskkh", scale: 3),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Redpoint San Marcos",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "\~\$600/month",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "4 beds/baths",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Gym/Pool/Parking avaliable",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "650 River Rd",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "San Marcos, TX 78666",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          Column(
            children: [
              Image.network("https://tinyurl.com/yw2rvnhh", scale: 1),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CastleRock San Marcos",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "\~\$800/month",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "1-2 beds/baths",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Gym/Pool/Parking avaliable",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "1610 N Interstate 35",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "San Marcos, TX 78666",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          Column(
            children: [
              Image.network("https://tinyurl.com/cersv2ue", scale: 1),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vistas of San Marcos",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "\~\$650/month",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "4 beds/baths",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Gym/Pool/Parking avaliable",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "401 Fredericksburg St.",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "San Marcos, TX 78666",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          Text("© 2021 Texas Real State"),
        ],
      ),
    );
  }
}
