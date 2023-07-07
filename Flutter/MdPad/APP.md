# 1. App Develop process
* 기획 -> UI 구상 -> 구현 -> 테스트

* UI 구상
  * 구현할때 폴더 구조를 잘 잡아야 협업과 유지보수에 용이
  * 피그마(Figma), 어도비(Adobe) XD, 플러터 플로우(Flutter Flow) 프로그램을 주로 사용
  * 피그마 : UI 디자인에 특화, 모바일 태블릿 웹등의 UI를 간단하게 구현하고 CSS나 플러터 코드로 받아 볼수 있음
  * 어도비 XD : 어도비에서 구현한 UI 디자인 툴, 피그마와 유사
  * 플러터 플로우 : 플러터에 특화된 UI 구현 툴, UI를 디자인하면 플러터 앱을 통째로 반환해줌, 코드를 전혀 작성하지 않아도 되는 노코드 솔루션
  
* 플러그인 추가 방법
  * pubspec.yaml 파일에 원하는 플러그인을 추가하고 [pub get] 버튼을 눌러 프로젝트에 사용
  * ex) WebView 플러그인
  
        dependecies:
            flutter:
                sdk: flutter
            cupertino_icons: ^1.0.2
            webview_flutter: 2.3.1 // 웹뷰 플러그인 추가 후 pubspec.yaml 파일 화면 위의 [pub get] 버튼 클릭

  * CLI 명령어 
    1. flutter pub get : pubspec.yaml 파일에 등록한 플러그인을 내려받음
    2. flutter pub add [플러그인이름] : pubspec.yaml에 플러그인을 추가
    3. flutter pub upgrade : pubspec.yaml에 등록된 플러그인들을 모두 최신버전으로 업데이트
    4. flutter pub upgrade --major-versions : 최신버전으로 업데이트
    5. flutter pub run : 현재 프로젝트를 실행합니다. 어떤 플랫폼에서 실행할지 선택 가능
   
* 주변장치 종류
  * 센서 : sensors_plus
  * gps : geolocator
  * 카메라 : camera
  * 블루투스: flutter_blue
  * 와이파이 : wifi_iot
  
* 이미지 출력하기
  * 기본 Image 생성자: ImageProvider라는 또 다른 위젯에서 이미지를 그림
  * Image.asset 생성자: 앱에 저장된 asset파일로 이미지를 그림
  * Image.netwokr 생성자 : URL을 통해 이미지를 그림
  * Image.file 생성자 :  파일을 통해 이미지를 그림
  * Image.memory 생성자 : 메모리에서 직접 이미지를 그림
   
# 2. 안드로이드와 iOS 네이티브 설정
  *  카메라, 사진첩, 푸시 권한등 보안, 하드웨어에 접근할때 네이티브 설정을 해주어야함
  *  네이티브 설정이 필요한 플로그인은 보통 플러그인 홈페이지에 설정법이 상세히 기재되어있음
  *  해당 플로그인의 pub.dev소개 페이지에서 확인
  1. android 설정
       * android/app/src/main/AndroidManifest.xml 에서 설정
       * 주 권한
          1. INTERNET : 인터넷
          2. CAMERA : 카메라
          3. WRITE_EXTERNAL_STORAGE : 앱 외부에 파일을 저장할 권한
          4. READ_EXTERNAL_STORAGE : 앱 외부의 파일을 읽을 권한
          5. VIBRATE : 진동
          6. ACCESS_FINE_LOCATION : GPS 와 네트워크를 모두 사용해서 현재위치 정보를 가져올 권한
          7. ACCESS_COARSE_LOCATION : 네트워크만 사용해서 대략적인 위치 정보를 가져올 권한
          8. ACCRESS_BACKGROUND_LOCATION : 앱이 배경에 있을 때 위치 정보를 얻을 권한
          9. BILLING : 인앱 결제 권한
          10. CALL_PHONE : 전화기 앱을 사용하지 않고 전화를 걸 권한
          11. NETWORK_STATE : 네트워크 상태를 가져올 권한
          12. RECORD_AUDIO : 음성을 녹음할 권한
      * android/app/build.gradle : 모듈 파일이며, 의존성, 버전 정보
      * android/build.gradle : 프로젝트 파일이며, 클래스패스, 레포지토리 정보


  2. iOS 설정  
      * Info.plist: iOS앱의 런타임을 설정하는 파일
        1. NSAppTransprotSecurity : http 프로토콜을 허용하는 키값
        2. NSCalendarsUsageDescription : 달력 사용 권한 메세지
        3. NSCameraUsageDescription : 카메라 사용 권한 메세지
        4. NSContactsUsageDescription : 연락처 
        5. NSLocationUsageDescription : 위치 정보
        6. NSPhotoLibraryUsageDescription : 사진
        7. NSFaceIDUsageDescription : FaceID
        8. NSMicrophoneUsageDescription : 마이크
        9. NSMotionUsageDescription : Accelerometer 
        10. NSSiriUsageDescription: : siri
        11. NSAppleMusicUsageDescription : 애플 뮤직
        12. 그외 애플 공식 사이트
        
# 3. http , https
  * 안드로이드와 iOS 모두 기본적으로 http 사용을 막아두었음.
  * 이 설정을 해제하려면 
    1. 안드로이드 : Manifest에서 
    
            android:usesCleartextTraffic="true"

    2. iOS : Info.plist에서 

            <key>NSAppTransportSecurity</key>
            <dict>
              <key>NSAllowsLocalNetworking</key>
              <true/>
              <key>NSAllowsArbitraryLoadsInWebContent</key>
              <true/>
            </dict>

# 4. pubspec.yaml
dev_dependencies의 경우 dependencies와 달리 개발시에만 사용되고 앱패키징엔 포함되지 않음