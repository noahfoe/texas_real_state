import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyGalleryPage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  MyGalleryPage(
      {required this.email,
      required this.firstName,
      required this.lastName,
      Key? key})
      : super(key: key);

  @override
  _MyGalleryPageState createState() => _MyGalleryPageState(
      email: email, firstName: firstName, lastName: lastName);
}

class _MyGalleryPageState extends State<MyGalleryPage> {
  late String email;
  late String firstName;
  late String lastName;
  _MyGalleryPageState(
      {required this.email, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(email: email, firstName: firstName, lastName: lastName),
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
              _buildListing(
                  "https://tinyurl.com/5hekskkh",
                  "https://redpoint-sanmarcos.com/",
                  "Redpoint San Marcos",
                  "\~\$600/month",
                  "4 beds/baths",
                  "Gym/Pool/Parking avaliable",
                  "650 River Rd",
                  "San Marcos, TX 78666"),
            ],
          ),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          _buildListing(
              "https://tinyurl.com/yw2rvnhh",
              "https://www.castlerocksanmarcos.com/",
              "CastleRock San Marcos",
              "\~\$800/month",
              "1-2 beds/baths",
              "Gym/Pool/Parking avaliable",
              "1610 N. Interstate 35",
              "San Marcos, TX 78666"),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          _buildListing(
              "https://tinyurl.com/cersv2ue",
              "https://www.americancampus.com/student-apartments/tx/san-marcos/vistas-san-marcos",
              "Vistas of San Marcos",
              "\~\$650/month",
              "4 beds/baths",
              "Gym/Pool/Parking avaliable",
              "401 Fredericksburg St.",
              "San Marcos, TX 78666"),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          _buildListing(
              "https://tinyurl.com/wj35p2k",
              "https://cottagesatsanmarcos.com/",
              "Cottages of San Marcos",
              "\~\$600/month",
              "3-6 beds/baths",
              "Gym/Pool/Parking avaliable",
              "1415 Craddock Ave.",
              "San Marcos, TX 78666"),
          Divider(
            height: 25,
            thickness: 1,
            color: Colors.red,
          ),
          _buildListing(
              "https://tinyurl.com/mdkbhra2",
              "https://www.thelocalsanmarcos.com/",
              "The Local Downtown",
              "\~\$750/month",
              "1-4 beds/baths",
              "Gym/Pool/Parking avaliable",
              "210 N. Edward Gary St.",
              "San Marcos, TX 78666"),
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

  GestureDetector _buildListing(
      String url,
      String websiteUrl,
      String title,
      String price,
      String beds,
      String amenities,
      String address,
      String city) {
    return GestureDetector(
      onTap: () {
        _launchWebsite(websiteUrl);
      },
      child: Column(
        children: [
          Image.network(
            url,
            scale: 1,
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : LinearProgressIndicator();
            },
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                beds,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(width: 10),
              Text(
                amenities,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                address,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                city,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchWebsite(websiteUrl) async => await canLaunch(websiteUrl)
      ? await launch(websiteUrl)
      : throw 'Could not launch $websiteUrl';
}
