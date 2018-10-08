import 'dart:async';

import 'package:lemonade/data/entity/session.dart';

abstract class SessionRepository {
  Future<Session> addSession(Session session);

  Future<Session> removeSession(Session session);

  Future<List<Session>> sessions();

  Future<Session> setActiveSession(Session session);

  Future<Session> activeSession();
}
