
import 'package:isar/isar.dart';

part 'isar.g.dart';


@Collection()
class Managed {
  int id = isarAutoIncrementId; 
 late String title;
 late String description; 
 late String filePath; 

}
