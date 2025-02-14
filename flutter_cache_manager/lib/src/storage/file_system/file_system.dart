import 'package:file/file.dart';

abstract class FileSystem {
  Future<File> createFile(String name);
  Future<Directory> get directory;
}
