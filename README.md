# Hướng dẫn Cài đặt và Chạy Dự án TLU Students

Chào mừng bạn đến với dự án **TLU Students** (TLU Help) - ứng dụng Flutter dành cho sinh viên trường Đại học Thăng Long, hỗ trợ quản lý lịch học, thời khóa biểu, điểm số, điểm danh bằng khuôn mặt (Face Recognition), hỗ trợ chat AI trợ lý ảo, và nhận thông báo thời gian thực.

Dự án sử dụng **Flutter Version Manager (FVM)** để đồng bộ hóa phiên bản Flutter SDK (`3.29.1`) giữa các thành viên phát triển.

---

## Các tính năng chính
- **Xem Lịch học & Điểm số:** Tích hợp API đồng bộ lịch học, bảng điểm và lịch sử GPA theo học kỳ.
- **Điểm danh thông minh:** Điểm danh bằng nhận diện khuôn mặt (Google ML Kit Face Detection & Camera) kết hợp kiểm tra vị trí địa lý (GPS/Geolocator) trong bán kính cho phép.
- **Nhận thông báo thời gian thực:** Tích hợp Firebase Cloud Messaging (FCM) để nhận thông báo tức thời.
- **Hỗ trợ Chat AI:** Trợ lý ảo AI giúp sinh viên giải đáp các thắc mắc học tập.
- **Quản lý học phí:** Theo dõi tình trạng đóng học phí và thực hiện thanh toán học phí qua hệ thống.

---

## Yêu cầu hệ thống trước khi cài đặt (Prerequisites)
Đảm bảo máy tính của bạn đã được cài đặt các công cụ sau:
1. **Git** (để clone dự án)
2. **Flutter SDK** (Khuyến nghị quản lý thông qua FVM) dùng phiên bản 3.29.1 là phù hợp nhất để không bị sung đột với các file thư viện khác
3. **FVM (Flutter Version Manager)**:
   - Cài đặt qua Homebrew (macOS): `brew install fvm`
   - Hoặc cài đặt qua Dart pub: `dart pub global activate fvm`
4. **Android Studio** (cấu hình Android SDK/Emulator) 
---

## 🚀 Hướng dẫn Cài đặt & Chạy dự án

### Bước 1: Tải mã nguồn dự án
Mở Terminal và clone dự án về máy: git clone https://github.com/manhkha12/TLU-help.git

### Bước 2: Cài đặt phiên bản Flutter phù hợp
Dự án được cấu hình chạy trên phiên bản Flutter **3.29.1** (lưu ở file `.fvmrc`). Chạy lệnh sau để FVM tự động tải và cấu hình phiên bản SDK này:
```bash
fvm install
```

### Bước 3: Cài đặt các thư viện (Dependencies)
Tải toàn bộ package phụ thuộc được định nghĩa trong `pubspec.yaml`:
```bash
fvm flutter pub get
```

### Bước 4: Sinh mã tự động (Code Generation)
Dự án sử dụng `build_runner` để sinh mã tự động cho Freezed, JSON Serializable và sinh assets tự động (qua Flutter Gen). Hãy chạy lệnh dưới đây:
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```
*(Nếu sử dụng Dart 3, bạn cũng có thể chạy: `fvm dart run build_runner build --delete-conflicting-outputs`)*

### Bước 5: Cấu hình Firebase
Để ứng dụng nhận được thông báo từ Firebase Cloud Messaging, bạn cần cấu hình file chứng thực:
1. **Android:** Tải file `google-services.json` từ Firebase Console và đặt vào đường dẫn:
   `android/app/google-services.json`
2. **iOS:** Tải file `GoogleService-Info.plist` từ Firebase Console và đặt vào đường dẫn:
   `ios/Runner/GoogleService-Info.plist`


### Bước 7: Khởi chạy ứng dụng (Run App)
1. Kết nối thiết bị Android/iOS thật (đã bật Developer Mode & USB Debugging) hoặc mở thiết bị ảo (Emulator/Simulator).
2. Khởi chạy ứng dụng:
   ```bash
   fvm flutter run
   ```
3. Nếu bạn muốn chạy trên một thiết bị cụ thể từ danh sách thiết bị đang kết nối:
   ```bash
   # Xem danh sách thiết bị và ID
   fvm flutter devices
   
   # Chạy trên thiết bị chỉ định
   fvm flutter run -d <ID_THIET_BI> or an nut rn witout debugging 
   ```


## 📁 Cấu trúc Thư mục Dự án

```text
lib/
├── data/              # Tương tác dữ liệu từ xa (Dio HTTP Client, Interceptors, Socket.IO Client)
├── di/                # Thiết lập Dependency Injection (GetIt) tách biệt theo các module
├── features/          # Chứa giao diện và logic Bloc/Cubit cho từng chức năng chính:
│   ├── checkin/       # Điểm danh bằng khuôn mặt (Face Recognition, Camera, GPS)
│   ├── chat/          # Trò chuyện AI với trợ lý ảo hỗ trợ học tập
│   ├── localization/  # Đa ngôn ngữ (Tiếng Việt - vi_VN, Tiếng Anh - en_US)
│   └── notification/  # Màn hình danh sách và chi tiết thông báo
├── gen/               # Tài nguyên tự động sinh ra cho assets, fonts, icons (Flutter Gen)
├── models/            # Các lớp thực thể dữ liệu (Data models)
├── repository/        # Lớp Repository làm cầu nối giữa Data Sources và Cubits/Blocs
├── services/          # Các dịch vụ nền (Firebase Messaging Service, Local Notifications)
├── shared/            # Các widgets dùng chung, hệ thống theme màu sắc và styles
└── main.dart          # File khởi chạy ứng dụng (Khởi tạo Firebase, DI, runApp)
```

---

## ⚠️ Một số lưu ý quan trọng
1. **Cấp quyền thiết bị (Permissions):** 
   - Ứng dụng cần quyền **Camera** và quyền **Vị trí địa lý (Location - GPS)** để thực hiện việc điểm danh sinh viên. Hãy đảm bảo cấp quyền đầy đủ khi có hộp thoại yêu cầu trên điện thoại.
2. **Sử dụng lệnh `fvm`:**
   - Tất cả các lệnh liên quan tới `flutter` hay `dart` nên được tiền tố bằng `fvm` (ví dụ: `fvm flutter run`) để chắc chắn dự án đang chạy đúng phiên bản SDK Flutter 3.29.1 đã quy định. Điều này tránh được các xung đột thư viện không đáng có.
3. **Phiên bản Java/JDK trên Android:**
   - Để build Android thành công mà không gặp lỗi Gradle, hãy cấu hình Java Home trên máy của bạn sử dụng **JDK 17** hoặc **JDK 21**.

---

