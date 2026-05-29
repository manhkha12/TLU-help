import 'package:dio/dio.dart';
import 'package:tlu_students/data/remote/handler/api_handler.dart';

class ModuleApi {
  final ApiHandler moduleApiHandler;
  final ApiHandler apiHandler;

  ModuleApi({
    required this.moduleApiHandler,
    required this.apiHandler,
  });

  Future<Map<String, dynamic>> getCalender() async {
    final resp = await apiHandler.get('/course-classes');
    return resp;
  }

  Future<List<dynamic>> getGrade() async {
    final resp = await apiHandler.get('/grades/me');
    return resp;
  }

  Future<List<dynamic>> getGpa() async {
    final resp = await apiHandler.get('/gpa-history/me');
    return resp;
  }

  Future<List<dynamic>> getSemester() async {
    final resp = await apiHandler.get('/semesters');
    return resp;
  }

  Future<List<dynamic>> getCourse(String? semesterId) async {
    final Map<String, dynamic> query = {};
    if (semesterId != null) {
      query['semester_id'] = semesterId;
    }
    final resp = await apiHandler.get(
      '/students/me/schedule',
      queryParameters: query,
    );
    return resp;
  }

  Future<Map<String, dynamic>> getNotification(
      {int skip = 0, int take = 20, bool? isRead}) async {
    final Map<String, dynamic> query = {
      'skip': skip,
      'take': take,
    };
    if (isRead != null) {
      query['is_read'] = isRead;
    }
    final resp = await apiHandler.get('/notifications', queryParameters: query);
    return resp;
  }

  Future<Map<String, dynamic>> getDetailNotification(
      String notificationId) async {
    final resp = await apiHandler.get('/notifications/$notificationId');
    return resp;
  }

  Future<void> markAsRead(String notificationId) async {
    await apiHandler.patch('/notifications/$notificationId/read');
  }

  Future<void> markAllAsRead() async {
    await apiHandler.patch('/notifications/read-all');
  }

  Future<void> deleteNotification(String notificationId) async {
    await apiHandler.delete('/notifications/$notificationId');
  }

  Future<void> registerFcmToken(
      String token, String deviceName, String platform) async {
    await apiHandler.post('/fcm/register', body: {
      'token': token,
      'device_name': deviceName,
      'platform': platform,
    });
  }

  Future<void> unregisterFcmToken(String token) async {
    await apiHandler.delete('/fcm/unregister', body: {
      'token': token,
    });
  }

  Future<Map<String, dynamic>> getDocumentTypes() async {
    final resp = await apiHandler.get('/document-types');
    return resp;
  }

  Future<Map<String, dynamic>> getServiceRequests() async {
    final resp = await apiHandler.get('/student/service-requests');
    return resp;
  }

  Future<Map<String, dynamic>> createServiceRequest(
      Map<String, dynamic> data) async {
    final resp = await apiHandler.post('/student/service-requests', body: data);
    return resp;
  }

  Future<Map<String, dynamic>> updateServiceRequest(
      dynamic id, Map<String, dynamic> data) async {
    final resp =
        await apiHandler.patch('/student/service-requests/$id', body: data);
    return resp;
  }

  Future<void> deleteServiceRequest(dynamic id) async {
    await apiHandler.delete('/student/service-requests/$id');
  }
  // --- CHAT AI ENDPOINTS ---

  Future<Map<String, dynamic>> sendChatMessage(String message,
      {String? sessionId}) async {
    final Map<String, dynamic> body = {'message': message};
    if (sessionId != null) {
      body['sessionId'] = sessionId;
    }
    final resp = await apiHandler.post('/chat/send', body: body);
    return resp;
  }

  Future<Map<String, dynamic>> createChatSession() async {
    final resp = await apiHandler.post('/chat/sessions');
    return resp;
  }

  Future<dynamic> getChatSessions() async {
    final resp = await apiHandler.get('/chat/sessions');
    return resp;
  }

  Future<dynamic> getChatMessages(String sessionId) async {
    final resp = await apiHandler.get('/chat/sessions/$sessionId/messages');
    return resp;
  }

  Future<void> deleteChatSession(String sessionId) async {
    await apiHandler.delete('/chat/sessions/$sessionId');
  }

  Future<Map<String, dynamic>> getAttendanceSession() async {
    final resp = await apiHandler.get('/attendance/sessions/me/active');
    return resp;
  }

  Future<Map<String, dynamic>> attendByFace({
    required String sessionId,
    required Map<String, dynamic> params,
  }) async {
    final String filePath = params['filePath'] as String;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
      'latitude': params['latitude'],
      'longitude': params['longitude'],
    });

    final resp = await apiHandler.post(
      '/face-recognition/attendance/$sessionId',
      body: formData,
    );
    return resp as Map<String, dynamic>;
  }

  // --- TUITION ENDPOINTS ---

  Future<List<dynamic>> getTuitionFees() async {
    final resp = await apiHandler.get('/tuition/me');
    return resp;
  }

  Future<Map<String, dynamic>> getTuitionDetail(String semesterId) async {
    final resp = await apiHandler.get('/tuition/me/$semesterId');
    return resp;
  }

  Future<Map<String, dynamic>> payTuition(String tuitionFeeId) async {
    final resp = await apiHandler.post('/tuition/pay/$tuitionFeeId');
    return resp;
  }
}
