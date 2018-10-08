import 'dart:async';
import 'package:lemonade/data/entity/session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lemonade/data/repository/session_repository.dart';

class SessionRepositoryImpl extends SessionRepository {
  static const String activeSessionKey = 'activeSessionId';
  static const String tableName = 'sessions';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnConsumerKey = 'consumerKey';
  static const String columnConsumerSecret = 'consumerSecret';
  static const String columnToken = 'token';
  static const String columnSecret = 'secret';
  Database _db;
  SharedPreferences _pref;

  Future open(String path) async {
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''create table $tableName (
        $columnId integer primary key,
        $columnName text not null,
        $columnConsumerKey text not null,
        $columnConsumerSecret text not null,
        $columnToken text not null,
        $columnSecret text not null
      );''');
    });
    _pref = await SharedPreferences.getInstance();
  }

  Future close() async {
    await _db.close();
  }

  @override
  Future<Session> addSession(Session session) async {
    await _db.execute('''insert into $tableName 
      values(${session.id}, ${session.name}, ${session.consumerKey}, ${session.consumerSecret}, ${session.accessToken}, ${session.accessSecret});     
    ''');
    return session;
  }

  @override
  Future<List<Session>> sessions() async {
    List<Map> result = await _db.execute('select * from $tableName;');
    return result.map<Session>((e) =>
        Session(e[columnId], e[columnName], e[columnConsumerKey], e[columnConsumerSecret], e[columnToken], e[columnSecret])).toList();
  }
  
  @override
  Future<Session> removeSession(Session session) async {
    await _db.execute('delete from $tableName where id = ${session.id};');
    return session;
  }

  @override
  Future<Session> setActiveSession(Session session) async {
    _pref.setInt(activeSessionKey, session.id);
    return session;
  }

  @override
  Future<Session> activeSession() async {
    var id = _pref.getInt(activeSessionKey);
    List<Map> result = await _db.execute('select * from $tableName where id = $id;');

    if (result.length > 0) {
      return Session(
        result.first[columnId], result.first[columnName], result.first[columnConsumerKey],
        result.first[columnConsumerSecret], result.first[columnToken], result.first[columnSecret]
      );
    }
    return null;
  }
}