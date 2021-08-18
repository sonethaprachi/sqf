import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqf/models/note.dart';



class databasehelper{
static databasehelper _databaseHelper;
static Database _database;
String noteTable = 'note_table';
String colid = 'id';
String coltitle = 'title';
String coldescription = 'description';
String colpriority = 'priority';
String coldate = ' date';
databasehelper.createInstance();
factory databasehelper(){
if(_databaseHelper == null){
 _databaseHelper = databasehelper.createInstance();
}
  return _databaseHelper;
}
Future<Database> get database async{
  if (_database == null){
    _database = await initialzeDatabase();
  }
  return _database;
}

Future<Database>    initialzeDatabase() async{
  Directory directory =  await getApplicationDocumentsDirectory();
  String path =directory.path + 'notes.db';
 var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
return notesDatabase;
}
void _createDb(Database Db, int newVersion) async{
  await Db.execute('CREAT TABLE  $noteTable( $colid INTEGER PRIMARY KEY AUTOINCREMENT,  $coltitle TEXT,' '  $coldescription TEXT, $colpriority INTEGER,  $coldate TEXT)');
}
Future<List<Map<String,dynamic>>>  getnoteMapList() async{
  Database db = await this.database;
  //var result = await db.rawQuery('SELECT * FORM $noteTable order by $colpriority ASC');
  var result = await db.query(noteTable, orderBy:' $colpriority ASC' );
  return result;
}
Future<int> insertNote(note Note) async{
  Database db = await this.database;
  var result = await db.insert(noteTable, Note.toMap());
  return result;

}
Future<int> updatetNote(note Note) async{
  Database db = await this.database;
  var result = await db.update(noteTable, Note.toMap(),where: '$colid = ?',whereArgs: [Note.id]);
  return result;
  }
  Future<int> deleteNote(note Note) async{
  Database db = await this.database;
  var result = await db.rawDelete('DELET FORM $noteTable WHERE $colid = $id');
  return result;
  }
  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> X = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(X);
    return result;
  }
}