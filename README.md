# 🚀 BaseProject Flutter

## 📌 프로젝트 소개
이 프로젝트는 Flutter MVVM 아키텍처를 기반으로 구축되었으며,
별도의 상태관리 라이브러리 없이 ChangeNotifier와 Provider를 활용하여 구현되었습니다.

✅ 불필요한 라이브러리를 줄이고   
✅ 유지보수성과 확장성을 고려한 구조를 제공합니다.

## ✨ 주요 특징
🔹 MVVM 패턴 적용   
→ View ↔ ViewModel ↔ Model 구조로 책임을 분리하여 유지보수성을 향상
   
🔹 Flutter 기본 상태관리 (ChangeNotifier) 사용   
→ setState 남발을 줄이고 notifyListeners()로 UI 업데이트를 효율적으로 처리
   
🔹 모듈화된 프로젝트 구조   
→ screen, view_model, state, service, repository 등을 나누어 깔끔한 코드 유지 가능

🔹 외부 API 및 로컬 저장소 연동 지원   
→ remote service (Dio, Retrofit, Http)   
→ local service (SharedPreferences, Hive)

## 📂 프로젝트 구조

```plaintext
base_project/
 ├── lib/                   
 │   ├── main.dart             # 앱 실행 파일
 │   ├── widgets/              # 재사용 가능한 UI 위젯
 │   ├── screens/              # 화면
 │   │   ├── page_name/
 │   │   │   ├── screen/       # UI 화면
 │   │   │   ├── state/        # 상태 클래스 (ViewModel이 관리할 데이터)
 │   │   │   ├── view_model/   # ViewModel (ChangeNotifier)
 │   ├── models/               # 모델 (데이터 클래스)
 │   ├── repository/           # 데이터 처리 (API or Local)
 │   ├── service/            
 │   │   ├── remote/           # 외부 API 통신 (dio, retrofit, http 등)
 │   │   ├── local/            # 내부 저장소 (shared_preferences, hive 등)
 ├── assets/                   # 이미지, JSON, 폰트 등 정적 리소스
 ├── pubspec.yaml              # 의존성 및 프로젝트 설정
 ├── README.md                 # 현재 문서

