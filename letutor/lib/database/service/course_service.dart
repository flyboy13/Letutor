import 'package:letutor/provider/base_services.dart';
import 'package:sprintf/sprintf.dart';

class CourseService extends BaseService {
  Future<dynamic> getAllCateGory() async {
    final response = await get('content-category');
    return response;
  }

  Future<dynamic> getAllCourse(
      {int page = 1, int type = 0, String q = ''}) async {
    final response = await get(sprintf(
        type == 0
            ?'course?page=%i&size=10&q=%s'
            : type == 1
                ? 'e-book?page=%i&size=10&q=%s'
                : 'material/interactive-e-book?page=%i&size=10&q=%s',
        [page, q]));
    return response;
  }
}
