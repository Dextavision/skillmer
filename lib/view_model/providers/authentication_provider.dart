import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/model/services/amplify_auth_service.dart';

// ###############################
// AWS COGNITO AUTHENTICATION PROVIDER
// ###############################
final authUserProviderAsync = FutureProvider<String>((ref) {
  final authAWSRepo = ref.watch(authAWSRepositoryProvider);
  return authAWSRepo.user.then((value) => value);
});
