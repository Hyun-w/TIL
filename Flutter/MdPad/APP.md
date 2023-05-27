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

  * CLI 명령어 : flutter pub get 으로도 가능

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
   
