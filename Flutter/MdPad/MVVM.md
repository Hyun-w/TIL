Model - View - ViewModel 그룹으로 이루어져있는 패턴   

데이터를 가공할 필요가 있는 경우에 사용   

1. Model : 다루게 될 데이터
2. View : 시각적인 요소, UIView

3. View Model : Model이 가지고 있는 정보를 View에 보여지는 값들로 변경

    MVC패턴에서 Controller가   
    Model의 데이터를 View에 맞게 뿌려주는 역할   
    Business Logic을 수행하는 역할

    MVVM패턴에서 ViewModel은
    Business Logic을 수행하지 않는다

장점   
ViewModel은 View와 독립이며, View가 필요로 하는 데이터만을 소유   
View와 의존성 분리    
View Controller가 거대해지는 것을 방지, 이로 유지보수, 재사용성, 테스트 용이   

단점   
ViewModel과 View의 양방향 binding 과정이 필요   
단순한 UI의 경우, MVVM은 지나칠 수 있다.   
앱이 커질 수록, Data Binding 과정이 복잡해짐    

주의점
앱이 많은 Model-to-view에 변화가 필요할 경우 효율적이나   
모든 객체들이 Model, ModelView, View의 카테고리에 맞게 사용되지 않을 수도 있다.   
앱의 요구사항이 바뀌고, 이를 기반으로 디자인 패턴을 골라야 하는 경우도 존재하기에 프로젝트 초기부터 MVVM 설계는 좋지 않을 수 도 있다.
다른 디자인 패턴과 같이 사용하는 것도 고려해 볼 만 하다.   