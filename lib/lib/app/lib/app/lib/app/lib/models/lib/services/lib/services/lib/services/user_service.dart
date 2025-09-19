import '../models/app_user.dart';
import 'firestore_service.dart';

class UserService {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> updateUserProfile(AppUser user) async {
    await _firestoreService.saveUserData(user.id, user.toMap());
  }

  Stream<AppUser?> getUserProfile(String uid) {
    return _firestoreService.streamUserData(uid).map((data) {
      if (data == null) return null;
      return AppUser.fromMap(data);
    });
  }
}
