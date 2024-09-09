// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/
import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(createToJson: false)
 class BaseResponse<T> {


   @JsonKey(fromJson: _dataFromJson)
    T? data;
    bool status;
    String messages;
    BaseResponse(this.data, this.status, this.messages);




    factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

    static T? _dataFromJson<T>(Object? json) {
      if (json == null) {
        return null;
      }
       if (json is Map<String, dynamic>) {
          return json as T;

       } else if (json is List) {
          return json as T;
       }

       throw ArgumentError.value(
          json,
          'json',
          'Cannot convert the provided data.',
       );
    }


}