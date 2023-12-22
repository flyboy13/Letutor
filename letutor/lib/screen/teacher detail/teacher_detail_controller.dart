import 'package:get/get.dart';
import 'package:letutor/control/base_controller.dart';
import 'package:letutor/database/service/tutor_api.dart';
import 'package:letutor/model/schedule.dart';
import 'package:letutor/model/tutor.dart';
import 'package:video_player/video_player.dart';

class TeacherDetailController extends BaseController {
  final _tutorService = Get.find<TutorApi>();

  final listSpecial = [
    'English for Business',
    'Conversational',
    'English for kids',
    'IELTS',
    'TOEIC'
  ];
  Rx<bool> isLoadingVideo = true.obs;
  Rx<bool> isPlayingVideo = false.obs;
  final Rx<bool> isLoadingInit = true.obs;
  late VideoPlayerController videoController = VideoPlayerController.networkUrl(Uri(
      path:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  final Rx<bool> isFavorite = true.obs;
  late String tutorId;
  final Rx<Tutor> tutor = Tutor().obs;
  final RxList<Schedule> schedules = <Schedule>[].obs;

  @override
  void onInit() {
    super.onInit();
    setUpData();
  }

  void setUpData() async {
    tutorId = Get.arguments['id'];
    try {
      await getDataTutor();
      await getDataSchedule();
      isFavorite.value = tutor.value.isFavorite;
      videoController = VideoPlayerController.networkUrl(Uri(path:tutor.value.video));
      videoController.initialize().then((value) {
        isLoadingVideo.value = false;
      });
      isLoadingInit.value = false;
    } catch (e) {
      print(e);
      isLoadingInit.value = false;
    }
  }

  onTapVideo() {
    isPlayingVideo.value = !isPlayingVideo.value;
    if (isPlayingVideo.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }

  getDataTutor() async {
    tutor.value = await _tutorService.getTutorById(tutorId);
  }

  getDataSchedule() async {
    final res = await _tutorService.getSchedule(tutorId);
    schedules.value = (res['scheduleOfTutor'] == null)
        ? []
        : (res['scheduleOfTutor'] as List)
            .map((e) => Schedule.fromJson(e))
            .toList();
  }
}
