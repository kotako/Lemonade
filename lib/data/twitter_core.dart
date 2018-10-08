import 'service/account_service.dart';
import 'service/media_service.dart';
import 'service/user_service.dart';
import 'service/status_service.dart';

abstract class TwitterCore {
  AccountService accountService();
  MediaService mediaService();
  UserService userService();
  StatusService statusService();

  logout();
}
