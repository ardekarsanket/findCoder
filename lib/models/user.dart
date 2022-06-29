import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String uid;

  //required
  late String name;

  //interests
  late String developerProfile;
  late String interestedIn;

  //mini resume
  String? passOutYear;
  String? college;
  String? internships;
  String? projects;
  String? languages;
  String? techStacks;
  String? githubProfile;
  String? linkedInProfile;
  String? achievements;

  //location
  late GeoPoint location;

  User(
      {required this.uid,
      required this.name,
      required this.developerProfile,
      required this.interestedIn,
      this.passOutYear,
      this.college,
      this.internships,
      this.projects,
      this.languages,
      this.techStacks,
      this.githubProfile,
      this.linkedInProfile,
      this.achievements});
}
