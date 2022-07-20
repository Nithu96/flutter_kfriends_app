import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/card_details.dart';
import '../models/community_card.dart';
import '../models/post_details.dart';
import '../services/font_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardDetailModel> cardDetails = [
    CardDetailModel(
        imageUrl: 'assets/userImage1.jpeg',
        name: 'Nickname',
        description:
            'Are you looking for a funny Korean friends? Here! Its me!'),
    CardDetailModel(
        imageUrl: 'assets/userImage2.jpeg',
        name: 'Nickname',
        description:
            'Are you looking for a funny Korean friends? Here! Its me!'),
    CardDetailModel(
        imageUrl: 'assets/userImage3.jpeg',
        name: 'Nickname',
        description:
            'Are you looking for a funny Korean friends? Here! Its me!'),
  ];

  List<CommunityCardDetailModel> CommunityCardDetails = [
    CommunityCardDetailModel(
        imageUrl2: 'assets/testImage1.jpeg', name: 'K-drama TOP 5'),
    CommunityCardDetailModel(
        imageUrl2: 'assets/userImage2.jpeg', name: 'K-POP best list'),
    CommunityCardDetailModel(
        imageUrl2: 'assets/userImage3.jpeg', name: 'Korean Soulfood'),
  ];

  List<PostDetailModel> postDetails = [
    PostDetailModel(
        imageUrl1: 'assets/userImage3.jpeg',
        name: 'Nickname',
        imageUrl2: 'assets/testImage1.jpeg',
        description: "This K-drama is funny!!",
        like: 11,
        comments: 8),
    PostDetailModel(
        imageUrl1: 'assets/userImage1.jpeg',
        name: 'Nickname',
        imageUrl2: 'assets/userImage2.jpeg',
        description: "Anyone know this actor?",
        like: 12,
        comments: 10),
    PostDetailModel(
        imageUrl1: 'assets/userImage3.jpeg',
        name: 'Nickname',
        imageUrl2: 'assets/testImage1.jpeg',
        description: "Anyone know this actor?",
        like: 13,
        comments: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: Image.asset(
          'assets/mainLogo.png',
          scale: 1,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'profile',
            color: Color(0xFF8B8B8B),
            onPressed: () {},
          ), //IconButton
        ],
        //<Widget>[]
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Menu Icon',
          color: Color(0xFF8B8B8B),
          onPressed: () {},
        ),
        //systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.23,
                child: Container(
                    child: Stack(children: <Widget>[
                  Image.asset(
                    'assets/mainImage.png',
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 110),
                    child: Column(
                      children: [
                        Text("ยังไม่มีเพื่อนเกาหลีใช่ไหม ?",
                            style: TextStyle(
                              color: Color(0xFFFFCF4E),
                              fontWeight: FontWeight.w700,
                              fontSize: FontSizeService().fs_s18,
                            )),
                        Text("Still no Korean friends?",
                            style: TextStyle(
                              color: Color(0xFFFFCF4E),
                              fontWeight: FontWeight.w700,
                              fontSize: FontSizeService().fs_s18,
                            )),
                      ],
                    ),
                  )
                ])),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Choose one of Korean Freinds',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: FontSizeService().fs_s17)),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF8B8B8B)),
                            ),
                            onPressed: () {},
                            child: Text('More',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FontSizeService().fs_s13)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 154,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              cardDetails == null ? 0 : cardDetails.length,
                          itemBuilder: (context, i) {
                            return cardDetailsShow(
                                cardDetails[i].imageUrl,
                                cardDetails[i].name,
                                cardDetails[i].description);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.52,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Simple Test & Game",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeService().fs_s18,
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 80,
                              width: 177,
                              decoration: BoxDecoration(
                                //color: Color(0xFFFFCF4E),
                                border: Border.all(color: Color(0xFFFFCF4E)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 88,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Level Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    FontSizeService().fs_s16,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("level test....",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    FontSizeService().fs_s11,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 87,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xFFFFCF4E),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: ImageIcon(
                                          AssetImage('assets/levelIcon.png'),
                                          size: 50,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              )),
                          Container(
                              height: 80,
                              width: 177,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFFFCF4E)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 88,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 9),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Matching Game",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    FontSizeService().fs_s15,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("matching ga..",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    FontSizeService().fs_s10,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 87,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xFFFFCF4E),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: ImageIcon(
                                          AssetImage('assets/matchingIcon.png'),
                                          size: 50,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Community',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: FontSizeService().fs_s18)),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF8B8B8B)),
                            ),
                            onPressed: () {},
                            child: Text('More',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FontSizeService().fs_s13)),
                          )
                        ],
                      ),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: CommunityCardDetails == null
                              ? 0
                              : CommunityCardDetails.length,
                          itemBuilder: (context, i) {
                            return communityCardDetailsShow(
                              CommunityCardDetails[i].imageUrl2,
                              CommunityCardDetails[i].name,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 155,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              postDetails == null ? 0 : postDetails.length,
                          itemBuilder: (context, i) {
                            return postDetailsShow(
                                postDetails[i].imageUrl1,
                                postDetails[i].name,
                                postDetails[i].description,
                                postDetails[i].imageUrl2,
                                postDetails[i].like,
                                postDetails[i].comments);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ), //A
    );
  }

  Widget cardDetailsShow(String imageUrl, String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 140,
        //height:60,
        decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // color: Colors.redAccent,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius: 25.0,
                        //backgroundImage: AssetImage("assets/testUser.png"),
                        backgroundImage: AssetImage(imageUrl)),
                  ),
                  Text(name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: FontSizeService().fs_s11)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 6.0, right: 6.0, bottom: 6.0),
                    child: Text(description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeService().fs_s10)),
                  ),
                  Container(
                    height: 20,
                    width: 65,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF82B9DF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text(
                        'More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizeService().fs_s13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget communityCardDetailsShow(String imageUrl2, String name) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Container(
        width: 120,
        decoration: const BoxDecoration(
            color: Color(0xFF000000),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Stack(children: <Widget>[
              Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl2),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 31),
                child: Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizeService().fs_s16,
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget postDetailsShow(String imageUrl1, String name, String description,
      String imageUrl2, double like, double comments) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: Container(
          width: 180,
          //height:60,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: Card(
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFFFFFFF),
                    radius: 21.0,
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                          radius: 55.0, backgroundImage: AssetImage(imageUrl1)),
                    ),
                  ),
                  title: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizeService().fs_s12),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeService().fs_s12),
                      ),
                      SizedBox(height: 4,),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Color(0xFF8B8B8B),
                            size: 14,
                          ),
                          Text(
                            like.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: FontSizeService().fs_s10),
                          ),
                          SizedBox(width: 8,),
                          Icon(
                            Icons.mail_outline,
                            color: Color(0xFF8B8B8B),
                            size: 12,
                          ),
                          Text(
                            comments.toString(),
                            style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: FontSizeService().fs_s10),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Container(
                        height: 50,
                        width: 85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imageUrl2),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
