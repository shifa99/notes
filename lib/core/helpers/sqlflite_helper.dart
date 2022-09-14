import 'dart:developer';


import 'package:path/path.dart';

class SqlFliteHelper {
  //tables names
  static String user = 'user';
  static String notes = 'notes';
  

//   static late Database database;
//   static Future<void> initDatabase() async {
//     // Get a location using getDatabasesPath
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'posbank.db');

// // Delete the database
// //await deleteDatabase(path);

// // open the database
//     database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await Future.wait([
//         db.execute(
//             'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT UNIQUE, password TEXT intrestId TEXT, imageAsBase64 TEXT)'),
//         db.execute(
//             'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT UNIQUE, userId TEXT , numOfRooms INTEGER)'),

//       ]);
//     });
//   }

//   static Future<bool> haveDiscount(int customerId) async {
//     List<Map> map = await database
//         .query(booking, where: 'cust_id = ?', whereArgs: [customerId]);
//     return map.isNotEmpty;
//   }

//   static Future<int> userExist(
//       {required String email, required String password}) async {
//     List<Map> maps = await database.query(user,
//         columns: ['id'],
//         where: 'password = ? and email = ? ',
//         whereArgs: [password, email]);
//     return maps.isNotEmpty ? maps.first['id'] : -1;
//   }

//   static Future<int> insertUser(
//       {required String email,
//       required String password,
//       required String name}) async {
//     return await database.insert(user, {
//       'email': email,
//       'password': password,
//       'name': name,
//     });
//   }

//   static Future<int> insertRoom(
//       {required int branchId, required double price, required int type}) async {
//     return await database.insert(
//       room,
//       {
//         'branchId': branchId,
//         'price': price,
//         'state': 0,
//         'beds': type == RoomType.single.index
//             ? 1
//             : type == RoomType.double.index
//                 ? 2
//                 : 20,
//         'type': type,
//       },
//     );
//   }

//   static Future<int> addBranchToHotal(
//       {required String name,
//       required String location,
//       required int number}) async {
//     return await database.insert(branch, {
//       'name': name,
//       'location': location,
//       'numOfRooms': number,
//     });
//   }

//   static Future<int> updateBranchHotal(int branchId) async {
//     return await database.update(
//       branch,
//       {
//         'numOfRooms': 0,
//       },
//       where: 'id = ?',
//       whereArgs: [branchId],
//     );
//   }

//   static Future<int> updateRoom(int branchId, Room roomData) async {
//     int remainingBeds = --roomData.availableBads;
//     return await database.update(
//       room,
//       {
//         'state': roomData.type == RoomType.single.name
//             ? 1
//             : remainingBeds == 0
//                 ? 1
//                 : 0,
//         'beds': remainingBeds,
//       },
//       where: 'id = ? and branchId = ?',
//       whereArgs: [roomData.id, branchId],
//     );
//   }

//   static Future<int> createBook(Booking bookingData) async {
//     return await database.insert(booking, {
//       'book_date': bookingData.bookDate,
//       'cust_id': bookingData.customerId,
//       'totalPrice': bookingData.totalPrice,
//       'numberOfRooms': bookingData.numberOfRooms,
//     });
//   }

//   static Future<void> createBookContainRow(
//       {required int bookId, required int roomId}) async {
//     database.insert(
//       bookContain,
//       {
//         'book_id': bookId,
//         'room_id': roomId,
//       },
//     );
//   }

//   static Future<List<Branch>> getBranches() async {
//     List<Map> maps = await database.query(
//       branch,
//     );
//     log(maps.toString());
//     return maps.isEmpty
//         ? []
//         : List.from(maps).map((e) => BranchModel.fromJson(e)).toList();
//   }

//   static Future<List<Booking>> getMyReservations() async {
//     final map = await database.query(
//       booking,
//       where: 'cust_id = ?',
//       whereArgs: [serviceLocater.get<CacheHelper>().getDate(key: 'id')],
//     );
//     return List.from(map).map((e) => BookingModel.fromJson(e)).toList();
//   }

//   static Future<List<Room>> getRooms(int branchId) async {
//     List<Map> maps = await database.query(
//       room,
//       where: 'branchId = ?',
//       whereArgs: [branchId],
//     );
//     log(maps.toString());
//     return maps.isEmpty
//         ? []
//         : List.from(maps).map((e) => RoomModel.fromJson(e)).toList();
//   }
// }

// class TodoProvider {
//   late Database db;

//   Future open(String path) async {
//     db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
// //       await db.execute('''
// // // create table $tableTodo (
// // //   $columnId integer primary key autoincrement,
// // //   $columnTitle text not null,
// // //   $columnDone integer not null)
// // // ''');
//     });
//   }

  // Future<Todo> insert(Todo todo) async {
  //   todo.id = await db.insert(tableTodo, todo.toMap());
  //   return todo;
  // }

  // Future<Todo> getTodo(int id) async {
  //   List<Map> maps = await db.query(tableTodo,
  //       columns: [columnId, columnDone, columnTitle],
  //       where: '$columnId = ?',
  //       whereArgs: [id]);
  //   if (maps.length > 0) {
  //     return Todo.fromMap(maps.first);
  //   }
  //   return null;
  // }

  // Future<int> delete(int id) async {
  //   return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> update(Todo todo) async {
  //   return await db.update(tableTodo, todo.toMap(),
  //       where: '$columnId = ?', whereArgs: [todo.id]);
  // }

  // Future close() async => db.close();
}
