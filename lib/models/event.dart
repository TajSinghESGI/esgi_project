import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esgi_project/controllers/user_controller.dart';
import 'package:esgi_project/models/user.dart';
import 'package:esgi_project/utils/functions.dart';

class Event {
  final String id, userId;
  final User userOrganizer;
  String title, content, category, address, dateStart, dateEnd;
  int price;
  List<String> pictures;
  final bool preview;
  Map location;
  final int distanceBW;

  Event({
    this.id,
    this.userId,
    this.title,
    this.content,
    this.category,
    this.address,
    this.dateStart,
    this.dateEnd,
    this.userOrganizer,
    this.price,
    this.pictures,
    this.preview: false,
    this.location,
    this.distanceBW,
  });

  factory Event.fromDocument(DocumentSnapshot doc) {
    return Event(
      id: doc["id"],
      userId: doc['userId'],
      title: doc['title'],
      content: doc['content'],
      category: doc['category'],
      address: doc['address'],
      location: doc['location'],
      distanceBW: calculateDistance(
              UserController.to.user.location == null ? doc['location']['latitude'] : UserController.to.user.location['latitude'],
              UserController.to.user.location == null ? doc['location']['longitude'] : UserController.to.user.location['longitude'],
              doc['location']['latitude'],
              doc['location']['longitude'])
          .round(),
      dateStart: parseDateTime(doc["dateStart"].toDate(), "dd/MM/yyyy HH:mm"),
      dateEnd: parseDateTime(doc["dateEnd"].toDate(), "dd/MM/yyyy HH:mm"),
      price: doc["price"],
      userOrganizer: User.fromMap(doc["userOrganizer"]),
      pictures: List.generate(doc['pictures'].length, (index) {
        return doc['pictures'][index] as String;
      }),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "content": content,
      "category": category,
      "address": address,
      "dateStart": parseDateString(dateStart, "dd/MM/yyyy HH:mm"),
      "dateEnd": parseDateString(dateEnd, "dd/MM/yyyy HH:mm"),
      "price": price,
      "userOrganizer": userOrganizer.toMapOrganizer(),
      "pictures": pictures,
      "location": location,
    };
  }
}
