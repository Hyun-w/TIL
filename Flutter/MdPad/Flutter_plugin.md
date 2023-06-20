# Geolocator 플러그인
1. 위치 서비스를 사용할 수 있는 권한을 확인 및 요청   

        final isLocationEnabled = await Geolocator.isLocationServiceEnabled(); // 위치 서비스 기능 활성화 여부

        final checkedPermission = await Geolocator.checkPermission(); // 권한 확인
        final checkedPermission = await Geolocator.requestPermission(); // 권한 요청 둘다 LocationPermission enum을 반환

    리턴    
    denied : 한번도 요청한 적이 없거나 거절 상태. requestPermission()으로 재요청가능   
    denied forever : requestPermission()해도 권한 다이얼로그가 실행되지 않음, 기기의 설정화면에서 사용자가 직접 권한 허가 해줘야함   
    whileInUse : 앱이 사용 중 허가   
    always: 항상   
    unableToDetermine : 알수없음, 위치 권한을 요청할수 없는 특정 인터넷 브라우저   
  
2. GPS 위치가 바뀔 때마다 현재 위치값을 받을 수 있는 기능

        Geolocator.getPositionStream().listen((Position position){
            print(position);
        });
    
    Position 클래스 주요 속성   
    longitude : 경도   
    latitude : 위도   
    timestamp : 위치가 확인된 날짜 및 시간   
    accuracy : 위치 정확도, 특정 기기에서는 확인 불가   
    speed : 이동 속도, 특정 기기 확인 불가   
    speedAccuracy : 이동 속도 정확도, 특정 기기 확인 불가   

3. 현재 위치와 건물 간의 거리 계산
   
        final distance = Geolocator.distanceBetween(
            sLat, // 시작점 위도
            sLng, // 시작점 경도
            eLat, // 끝지점 위도
            eLng, // 끝지점 경도
        );

    