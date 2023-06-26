# HTTP 요청
1. protocol   
   http or https
2. host Ex. www.domain.com   
   요청하는 사이트의 도메인 
3. port Ex. :1234   
   HTTP요청은 80번 포트, HTTPS메서드는 보통 443 포트
4. resource path Ex. /path/to/resource   
   요청의 경로, 불러올 데이터의 정보가 명시되어 있음   
   경로에 따라 API 서버에서 로직을 실행하고 데이터를 반환
5. query Ex. ?a=b&x=y   
   ? 다음에 추가, 각 쿼리는 &로 구분   
   각 쿼리 데이터는 Map형태처럼 키와 값으로 이루어져있으며, 왼쪽은 키, 오른쪽은 값

## Header
HTTP 요청에서 보내는 데이터에 대한 메타 정보를 입력하는 부분   
바디 구성 정보, 데이터의 총 길이, 어떤 브라우저에 대한 요청인지 대한 정보, 로그인 후 발급받은 토큰을 서버로 다시 보낼 때   
이 요청에 대한 방법이 REST API, GraphQL, gRPC 등   
1. REST API: HTTP의 GET, POST, PUT, DELETE 등의 메서드를 사용하는 API   
HTTP를 이용해서 자원(Resource)를 명시하고 해당 자원에 대한 CRUD(Create, Read, Update, Delete)연산을 실시
2. GraphQL: Graph구조, 클라이언트에 직접 필요한 데이터를 명시 가능, 필요한 데이터만 요청가능
3. gRPC: HTTP/2를 사용하는 통신 방식, Protocol Buffers라는 방식을 사용하며 레이턴시의 최소화가 목적   

## 요청 Method
1. GET   
   서버로부터 데이터를 가져옴. 브라우저에서 사이트에 접속하면 GET 메서드를 사용해, HTML, CSS, JS파일 등을 불러옴.   
   GET 메서드는 HTML 문서의 body를 사용하지 않고 데이터를 전송할 필요가 있을 때 쿼리 매개변수를 사용합니다.
2. POST   
   데이터를 서버에 저장. POST 메서드는 body를 자주 사용하는 요청중 하나로 생성할 데이터에 대한 정보를 HTML 문서의 바디에 입력합니다. 쿼리 매개변수 또한 사용할 수 있으나 POST 메서드에서는 자주 사용하지 않음
3. PUT   
   데이터를 업데이트함. PUT 메서드 또한 쿼리 매개변수와 body를 사용할 수 있음
4. DELETE   
   데이터를 삭제함. POST 메서드 그리고 PUT 메서드와 마찬가지로 쿼리 매개변수와 body 모두 사용 가능
   
# REST API
Respresentational State Transfer API는 REST 기준을 따르는 HTTP API.   
HTTP 요청의 GET, POST, PUT, DELETE 와 REST API의 차이점은 REST API는 균일한 인터페이스, 무상태, 계층화, 캐시 원칙을 준수하는 HTTP API. 이를 RESTfult API라고 함
1. 균일한 인터페이스 : 요청은 균일한 인터페이스를 가지고 있어야함. 요청만으로 어떤 리소스를 접근하는지 알수 있어야 하며, 수정 또는 삭제를 한다면 해당 작업을 실행할 리소스 정보를 충분히 제공해야함
2. 무상태 Stateless : 요청이 완전 분리될수 있어야함. 하나의 요청이 이전 또는 이후의 요청과 완전 독립된 형태로 구현되어야 하며 임의의 순서로 요청이 처리될 수 있어야함.
3. 계층화된 시스템 : 클라이언트와 서버 사이에 다른 중개자에 요청을 연결할 수 있다. 이 중개자는 또 다른 서버가 될 수 있음. 클라이언트에서는 이 계층이 보이지 않음
4. 캐시 : 클라이언트는 응답 속도를 개선할 목적으로 일부 리소스를 저장 가능. 공통 사용되는 이미지나 헤더가 있을 때, 해당 요청을 캐싱함으로서 응답 속도를 빠르게 하거나 불필요한 요청을 줄일 수 있음. 추가로 캐시가 불가능한 API를 지정할 수 도 있음.
   
플러터 프레임워크에서는 HTTP 요청을 하는 데 일반적으로 http 플러그인이나 dio 플로그인을 사용

    import 'package:dio/dio.dart';

    void main() async {
        final getResp = Dio().get('http://www.test.com'); // HTTP Get 요청
        final postResp = Dio().post('http://www.test.com'); // HTTP Post 요청
        final putResp = Dio().put('http://www.test.com'); // HTTP Put 요청
        final deleteResp = Dio().delete('http://www.test.com'); // HTTP Delete 요청
    }

Dio 클래스를 인스턴스화하고 메소드를 함수 이름으로 실행해주면 됨. 모든 함수의 첫 번째 매개변수에는 URL 입력.   
REST API 통신을 하면서 응답으로 XML이나 HTML 같은 문자열을 전달할수 있고 JSON 처럼 객체를 전달할 수 있음.

# JSON
HTTP 요청에서 body를 구성할 때 사용하는 구조는 크게 XML 과 JSON 이 있음.
XML은 구식으로 현대 API에서는 잘 사용 안함 JSON 을 주로 사용.
JSON은 인간이 읽을수 있는 텍스트를 사용해 키-값 쌍으로 이루어진 데이터 객체를 전달하는 개방형 표준 포멧.

    {
        'name': 'Code',
        'languages': ['Javascript','Dart'],
        'age': 2
    }

REST API 요청할때 요청 및 응답 body에 JSON 구조를 자주 사용.   
플러터에서 JSON구조로 된 데이터를 응답 받으면 직렬화(Serialization)를 통해 클래스의 인스턴스로 변환하여 사용할수 있음.