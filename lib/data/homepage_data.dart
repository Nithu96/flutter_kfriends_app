import '../models/card_details.dart';
import '../models/community_card.dart';
import '../models/post_details.dart';

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