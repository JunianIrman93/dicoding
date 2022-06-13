import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding/src/models/creator_model.dart';

class CreatorService {
  final CollectionReference _creatorReference =
      FirebaseFirestore.instance.collection('creators');

  Future<List<CreatorModel>> fetchCreators() async {
    try {
      QuerySnapshot result = await _creatorReference.get();

      List<CreatorModel> creators = result.docs.map(
        (e) {
          return CreatorModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return creators;
    } catch (e) {
      rethrow;
    }
  }
}
