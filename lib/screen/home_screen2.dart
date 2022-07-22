import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kfriends/data/homepage_data.dart';
import 'package:kfriends/services/font_size.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        slideShowImage(),
        chooseKoreanFriends(),
        SizedBox(height: 16,),
        testGame(),
        community()
      ],
    ));
  }

  Widget community(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Community',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSizeService().fs_s18)),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF8B8B8B)),
                ),
                onPressed: () {},
                child: Text('More',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSizeService().fs_s15)),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              communityCardDetailsShow(
                CommunityCardDetails[0].imageUrl2,
                CommunityCardDetails[0].name,
              ),
              communityCardDetailsShow(
                CommunityCardDetails[1].imageUrl2,
                CommunityCardDetails[1].name,
              ),
              communityCardDetailsShow(
                CommunityCardDetails[2].imageUrl2,
                CommunityCardDetails[2].name,
              )
            ],
          ),
          const SizedBox(height: 16,),
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
            color: const Color(0xFFFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
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
                    backgroundColor: const Color(0xFFFFFFFF),
                    radius: 21.0,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
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
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: FontSizeService().fs_s12),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite_border_outlined,
                            color: Color(0xFF8B8B8B),
                            size: 14,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            like.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: FontSizeService().fs_s10),
                          ),
                          const SizedBox(width: 10,),
                          const Icon(
                            Icons.mail_outline,
                            color: Color(0xFF8B8B8B),
                            size: 12,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            comments.toString(),
                            style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w400, fontSize: FontSizeService().fs_s10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Container(
                        height: 50,
                        width: 85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imageUrl2),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget communityCardDetailsShow(String imageUrl2, String name) {
    return Container(
      height: MediaQuery.of(context).size.width/3 - 20,
      width: MediaQuery.of(context).size.width/3 - 20,
      decoration: const BoxDecoration(
          color: Color(0xFF000000),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        height: MediaQuery.of(context).size.width/3 - 20,
        width: MediaQuery.of(context).size.width/3 - 20,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl2),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
          child: Container(
            color: Colors.transparent,
            child:  Center(
              child: Text(name, textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,

                    fontWeight: FontWeight.w600,
                    fontSize: FontSizeService().fs_s16,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget testGame(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Simple Test & Game",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: FontSizeService().fs_s18,
              )),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              testButton('Level\nTest', 'Level Test', 'assets/levelIcon.png'),
              testButton('Matching\nGame', 'Matching Game', 'assets/matchingIcon.png'),
            ],
          )
        ],
      ),
    );
  }

  Widget testButton(String textOne, String textTwo, String path){
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width/2 - 30,
        decoration: BoxDecoration(
          //color: Color(0xFFFFCF4E),
          border: Border.all(color: const Color(0xFFFFCF4E)),
          borderRadius:
          const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width/2 - 120,
              child: Center(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textOne,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize:
                          FontSizeService().fs_s16,
                        )),

                    Text(textTwo,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
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
                          BorderRadius.circular(10))),
                  child: ImageIcon(
                    AssetImage(path),
                    size: 50,
                    color: Colors.white,
                  )),
            )
          ],
        ));
  }

  Widget chooseKoreanFriends() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Choose one of Korean Friends',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: FontSizeService().fs_s18)),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF8B8B8B)),
                  ),
                  onPressed: () {},
                  child: Text('More',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: FontSizeService().fs_s15)),
                )
              ],
            ),
            Container(
              height: 154,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cardDetails == null ? 0 : cardDetails.length,
                itemBuilder: (context, i) {
                  return cardDetailsShow(cardDetails[i].imageUrl,
                      cardDetails[i].name, cardDetails[i].description);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget slideShowImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Container(
          child: Stack(children: <Widget>[
        Image.asset(
          'assets/mainImage.png',
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: Column(
            children: [
              Text("ยังไม่มีเพื่อนเกาหลีใช่ไหม ?",
                  style: TextStyle(
                    color: Color(0xFFFFCF4E),
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeService().fs_s18,
                  )),
              Text("Still no Korean friends?",
                  style: TextStyle(
                    color: Color(0xFFFFCF4E),
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeService().fs_s18,
                  )),
            ],
          ),
        )
      ])),
    );
  }

  Widget cardDetailsShow(String imageUrl, String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 140,
        decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 25.0, backgroundImage: AssetImage(imageUrl)),
            ),
            Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSizeService().fs_s12)),
            Padding(
              padding:
                  const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 6.0),
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSizeService().fs_s10)),
            ),
            SizedBox(
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
                      color: Colors.white, fontSize: FontSizeService().fs_s13),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
