class API {
  //auth
  static const String login = 'auth/login';
  static const String signup = 'auth/register';
  static const String forgotPassword = 'user/forgotPassword';

  //tutor
  static const String listTutor = 'tutor/more?perPage=9&page=%i';
  static const String searchTutor = 'tutor/search';
  static const String scheduel = 'schedule';
  static const String getTutor = 'tutor/%s';
  static const String reviewTutor = 'feedback/v2/%s?perPage=10&page=%i';

  //scheduler
  static const String scheduelAll = 'booking/list/student';

  //course
  static const String catagoryCourse = 'content-category';
  static const String listCourse = 'course?page=%i&size=100';
  //user
  static const String userInfor = 'user/info';
  static const String changePassword = 'auth/change-password';
}
