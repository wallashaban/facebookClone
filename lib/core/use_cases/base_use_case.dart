import '../utils/exports.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<T> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}

class PushNotificationParameters {
  final String name;
  final String profilePic;
  final String uId;
  final String? token;
  final String body;
  final String title;

  const PushNotificationParameters({
    required this.name,
    required this.profilePic,
    required this.uId,
    this.token,
    required this.body,
    required this.title,
  });
}

class FriendInfoParamerters {
  final String name;
  final String profilePic;
  final String uId;
  final String id;
  const FriendInfoParamerters({
    required this.name,
    required this.profilePic,
    required this.uId,
    required this.id,
  });
}
