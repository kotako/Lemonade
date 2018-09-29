import 'dart:convert';
import 'dart:io';

final String credentialPath = '${Directory.current.path}/test/data/mock_credential.json';

final Map credential = jsonDecode(File(credentialPath).readAsStringSync()) as Map<String, dynamic>;