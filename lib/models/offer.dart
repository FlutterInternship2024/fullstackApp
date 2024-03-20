import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime displayDate;
  final double percentage;
  final String id;

  Offer(
      {required this.imageUrl,
      required this.startDate,
      required this.endDate,
      required this.displayDate,
      required this.percentage,
      required this.id});

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'startDate': startDate,
        'endDate': endDate,
        'percentage': percentage,
        'displayDate': displayDate,
        'id': id
      };

  static Offer fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Offer(
      imageUrl: snapshot['imageUrl'],
      startDate: snapshot['startDate'] ?? '',
      endDate: snapshot['endDate'] ?? '',
      percentage: snapshot['percentage'],
      displayDate: snapshot['displayDate'] ?? '',
      id: snapshot['id'] ?? '',
    );
  }
}
