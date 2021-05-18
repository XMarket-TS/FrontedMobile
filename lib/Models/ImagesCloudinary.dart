import 'dart:io';

class ImagesCloudinary {
  String _preset;
  String _tags;
  File _fileContents;

  // ImagesCloudinary(this._preset,this._tags,this._fileContents);
  ImagesCloudinary();

  String get preset => _preset;

  set preset(String value) {
    _preset = value;
  }

  String get tags => _tags;

  set tags(String value) {
    _tags = value;
  }

  File get fileContents => _fileContents;

  set fileContents(File value) {
    _fileContents = value;
  }

  Map toJson()=> {
    "upload_preset":preset,
    "tags": tags,
    "file": fileContents
  };
  ImagesCloudinary.fromJson(Map<String, dynamic> json) {
    preset = json['branchOfficeId'];
    tags = json['managerId'];
    fileContents = json['name'];
    // status=json['status'];
    // transaction=json['transaction'];
  }
}
