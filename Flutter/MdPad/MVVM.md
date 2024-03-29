Model - View - ViewModel 그룹으로 이루어져있는 소프트웨어 아키텍처 패턴   
GUI 코드로 구현하는 그래픽 사용자 인터페이스의 개발을 비즈니스 로직 또는 백엔드(모델)로부터 분리시켜서 뷰가 어떤 모델 플랫폼에 종속되지 않도록 해준다.   
뷰 모델이 모델에 있는 데이터 객체를 변환하는 책임을 지기 때문에 객체를 관리하고 표현하기가 쉬워짐을 의미한다.   

데이터를 가공할 필요가 있는 경우에 사용   

1. Model : 다루게 될 데이터

    객체 지향 접근법 : 실제 상태 내용을 표현하는 도메인 모델을 참조    
    데이터-중심 접근법 : 내용을 표현하는 데이터 접근 계층을 참조    

2. View : 시각적인 요소, UIView

    사용자가 화면에서 보는 것들에 대한 배치   
    모델을 보여서 표현하고 사용자와 뷰의 상호 작용(클릭, 키보드, 동작 등)을 수신하여, 이에 대한 처리를 뷰와 뷰 모델의 연결을 정의하고 있는 데이터 바인딩(속성, 이벤트 콜백 함수 등)을 통하여 뷰 모델로 전달한다.


3. View Model : Model이 가지고 있는 정보를 View에 보여지는 값들로 변경

    MVC패턴에서 Controller가   
    Model의 데이터를 View에 맞게 뿌려주는 역할   
    Business Logic을 수행하는 역할

    MVVM패턴에서 ViewModel은
    Business Logic을 수행하지 않는다

    공용 속성과 공용 명령을 노출하는 뷰에 대한 추상화. MVC 패턴의 컨트롤러나, MVP 패턴의 프리젠터(발표자)를 대신하여, MVVM 모데릉ㄴ 바인더를 가지는데, 이는 뷰모델에 있는 뷰에 연결된 속성과 뷰 사이의 통신을 자동화 한다.   
    뷰 모델은 모델에 있는 데이터의 상태   
    MVP의 프리젠터와의 차이점은, 프리젠터는 뷰에 대한 참조를 가지고 있는 반면, 뷰모델은 그렇지 않다는 것이다.   
    뷰는 뷰모델의 속성에 직접 바인드 된 채로 업데이트를 주고 받는다. 효율적으로 작동하기 위해 바인딩 기술 또는 바인딩을 하는 상요구 코드(boilerplate code)의 자동 생성이 필수이다.


4. Binder : 연결자, 뷰모델과 뷰의 동기화를 위해 상용구 로직을 작성해야하는 의무에서 개발자를 해방시켜 줌.

    MVVM에서 선언적인 데이터와 명령-바인딩이 내재되어있음. 마이크로소프트 스택을 사용하지 않고 구현한다면, 선언적인 데이터 바인딩 기술이 있어야 이 패턴을 만들수 있으며, 바인더가 없다면 MVP나 MVC를 사용해야 한다.


장점   
ViewModel은 View와 독립이며, View가 필요로 하는 데이터만을 소유   
View와 의존성 분리    
View Controller가 거대해지는 것을 방지, 이로 유지보수, 재사용성, 테스트 용이   

뷰 계층에서 사실상 모든 GUI 코드를 제거하여, 뷰 계층의 개발을 용이하게 하기위해 데이터 바인딩을 사용하도록 설계되었다.
데이터를 가능한 순수 응용 프로그램 모델에 가깝게 연결하는 데이터 바인딩과 프레임워크의 장점과 MVC의 기능 요소 개발의 분리라는 장점까지 얻으려고 한다.   
이로 인해 어떤 비즈니스 계층에 있든 데이터-검사 기능을 사용하여 들어오는 데이터를 검증한다. 결과적으로 모델과 프레임워크가 가능한 많은 작업을 수행하며, 뷰를 조작하는 응용 프로그램 로직은 최소화하거나 없애버린다. 

단점   
ViewModel과 View의 양방향 binding 과정이 필요   
단순한 UI의 경우, MVVM은 지나칠 수 있다.   
앱이 커질 수록, Data Binding 과정이 복잡해짐    

단순한 UI 작업에서는 MVVM을 구현하는 부담이 지나치게 과해진다.   
응용 프로그램이 커질수록, 뷰 모델을 폭 넓게 사용하기가 점점 어려워진다.   
아주 큰 응용 프로그램의 경우 데이터 바인딩을 사용하게 되면 눈에 띄게 메모리를 소모하게 된다.

주의점
앱이 많은 Model-to-view에 변화가 필요할 경우 효율적이나   
모든 객체들이 Model, ModelView, View의 카테고리에 맞게 사용되지 않을 수도 있다.   
앱의 요구사항이 바뀌고, 이를 기반으로 디자인 패턴을 골라야 하는 경우도 존재하기에 프로젝트 초기부터 MVVM 설계는 좋지 않을 수 도 있다.   
다른 디자인 패턴과 같이 사용하는 것도 고려해 볼 만 하다.   