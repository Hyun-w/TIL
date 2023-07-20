# 기능
1. Authentication : 인증 기능을 연동
2. App Check : 보안 기능, 허가되지 않는 클라이언트 차단
3. Firestore : 실시간으로 클라이언트와 서버의 데이터 연동, 쿼리 기능을 제공해주는 NoSQL 데이터베이스
4. Realtime Database : 파이어스토어와 비슷한 NoSQL 데이터베이스 기능을 제공, 빠른 속도와 효율에 초점
5. Storage : 이미지, 오디오, 비디오 등 사용자 생성하는 콘텐츠를 저장하는 저장소
6. Hosting : 웹 앱, 정적 및 동적 콘텐츠, 마이크로서비스를 호스팅
7. Functions : 파이어베이스 또는 HTTPS 요청에 의해 서버 코드를 실행할 수 있는 기능, 트래픽에 따라 필요한만큼 자동 확장되기 때문에 인프라 관리 필요 없음
8. Machine Learning : 간단한 몇 줄의 코드로 텍스트 인식, 이미지 라벨링, 물체 감지 및 추적, 얼굴 감지 및 윤관 추적 등 머신러닝 기능 사용 가능
9. Remote Config : 앱의 동작 모양과 기능을 앱을 새로 배포하지 않고도 변경 가능
10. Crashlytics : 앱에 충돌이 있을경우 모니터링 하는 기능
11. Performance : 앱 성능을 모니터링
12. Test Lab : 구글 데이터 센터에 실행되고 있는 여러 실제 프로덕션 기기를 사용해 앱을 테스트
13. App Distribution : 앱을 빠르고 쉽게 배포
14. Analytics : 앱의 트래픽과 사용자의 활동을 모니터링, 분석 가능
15. Messaging : 푸시 알림 설정

# 파이어스토어
NoSQL DB, 서버와 인프라 관리를 구글에서 해주기 때문에 백엔드에 신경 쓰지 않아도 됨    
클라이언트와 서버의 데이터를 실시간으로 연동하고, 오프라인 지원이 자동으로 되어 네트워크 지연과 인터넷 연결에 관계없이 데이터를 저장 가능    
파이어베이스에서 제공하는 SDK를 사용하면 따로 HTTP 요청 코드를 작성할 필요 없이 제공되는 SDK로 직관적 프로그래밍 가능   

넓은 범위에서 뮤료 기능을 제공, 사용량에 따라 돈을 내는 Pay As You Go모델   

두가지의 데이터 개념을 제공
1. 컬렉션: SQL 기반에서 테이블
2. 문서 : SQL 기반에서 열

NoSQL 문서는 SQL 와 비교해 더 유연한 데이터 구조 사용 가능   
키와 값의 조합으로 값이 들어가는 위치에 리스트나 맵등 완전한 JSON 구조를 통째로 저장 가능   

    JSON 형식
    {
        "name" : "Test",
        "age" : 31,
        "food" : ["치킨", "피자", "라면"],
    }

    SQL
    name    age
    Test    31

    person  name
    Test    치킨
    Test    피자
    Test    라면

SQL상 두가지 테이블을 NoSQL에선 JSON 형식으로 저장가능   

# 문서 삽입, 삭제, 조회, 업데이트
1. 파이어스토어 문서 삽입
    1. add() 함수

            final data = {
                "name" : "Test",
                "age" : 31,
                "food" : ["치킨", "피자", "라면"],
            }

            FirebaseFirestore.instance // 현재 플러터에 연동된 파이어스토어 기능을 불러옴
                .collection('person') // 문서를 저장할 컬렉션을 지정
                .add(data);

        문서의 ID가 자동생성됨//문서= SQL 열

    2. set() 함수

            final data = {
                "name" : "Test",
                "age" : 31,
                "food" : ["치킨", "피자", "라면"],
            }

            FirebaseFirestore.instance
                .collection('person')
                .doc('1') // 문서의 ID 지정
                .set(data);

        문서의 ID 지정하여 저장

2. 파이어스토어 문서 삭제

        FirebaseFirestore.instance
            .collection('person')
            .doc('1')
            .delete();

3. 파이어스토어 문서 조회   
    1. .snapshots() 실시간으로 업데이트(Stream)

            FirebaseFirestore.instance
                .collection('person')
                .snapshots();

        컬렉션의 모든 문서를 Stream<QuerySnapshot>형태로 받아올 수 있음   
        데이터가 업데이트 되면 즉시 화면에 반영 = 과도한 조회 가능성 존재

    2. .get() 1회성 업데이트(Future)

            FirebaseFirestore.instance
                .collection('person')
                .get();

        Future<QuerySnapShot>가 return, 실행한 순간 한번만 업데이트

    3. .doc() 특정 문서를 가져오고 싶을 때
        
            FirebaseFirestore.instance
                .collection('person')
                .doc('1')
                .snapshots(); //or .get();

4. 파이어스토어 문서 업데이트   
update() 함수 사용

        FirebaseFirestore.instance
            .collection('person')
            .doc('1')
            .update({
                'name' : '골든래빗',
            });
