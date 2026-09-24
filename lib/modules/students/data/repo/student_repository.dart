import 'package:either_dart/either.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../../../core/models/response_dto/response_dto.dart';
import '../../../../core/network/error_handling.dart';
import '../../../../core/network/network_handler.dart';

class StudentRepo {
  final api = NetworkHandler();

  Future<Either<MyError, ResponseDto>> getStudents({
    int page = 0,
    int size = 50,
    String sortBy = 'id',
    String direction = 'asc',
  }) {
    return api.getDataFromServer(
      url: Endpoints.getStudents,
      withToken: true,
      queryParameters: {
        'page': page,
        'size': size,
        'sortBy': sortBy,
        'direction': direction,
      },
    );
  }
}
