# 1. StatelessWidget
 * 위젯이 빌드되면 생성자가 실행됨
 * 이어서 필수로 override 해야하는 build() 함수가 실행됨
 * 마지막으로 build()함수에 반환한 위젯이 화면에 렌더링 됨
 * 플러터에서 모든 위젯은 Widget 클래스를 상속
 * Widget 클래스는 immutable 특성을 갖고 있음(한 번 생성하고 나면 속성을 변경 할 수 없음)
 * 한번 생성된 인스턴스의 build() 함수는 재실행 되지 않음
 * 인스턴스를 아예 새로 생성한 후 기존 인스턴스를 대체

# 2. StatefulWidget
 * Widget 클래스와 State 클래스 두개로 구성
  
 1. 상태 변경이 없는 생명주기
    1. 생성자가 실행
    2. createState() 함수가 실행 // 필수로 override 해야하는 함수 위젯과 연동되는 State 생성       
    3. State가 생성되면 initState()가 실행 // State가 생성되는 순간에만 한번 실행 후 절대 다시 실행되지 않음
    4. didChangeDependencies()가 실행 // initState()와 다르게 BuildContext가 제공되고 State가 의존하는 값이 변경되면 재실행
    5. State의 상태가 dirty로 설정 // dirty 상태는 build()가 재생성 되애 하는 상태
    6. build() 함수가 실행되고 UI가 반영
    7. build() 함수가 실행 완료되면 상태가 clean 상태로 변경// 화면에 변화가 없을시 이 상태를 유지
    8. 위젯이 위젯 트리에서 사라지면 deactivate()가 실행 // deactivate()는 State가 일시적, 영구적으로 삭제될 때 실행
    9. dispose()가 실행 // 위젯으 영구적으로 삭제될 때 실행
 2. 생성자의 매개변수가 변경되었을 때의 생명주기
    1. 위젯이 생성된 후 삭제되기 전 매개변수가 변경됨
    2. 위의 1-7. 상태(clean)에서 didUpdateWidget() 함수가 실행
    3. State가 dirty 상태로 변경
    4. build()가 실행
    5. State가 clean 상태로 변경
 3. State 자체적으로 build()를 재실행할 때의 생명주기
    1. 위젯의 State 클래스는 setState() 함수를 실행하여 자체적으로 build() 함수를 재실행 할수 있음
    2. State상태가 dirty 상태로 변경
    3. build() 가 실행
    4. clean 상태로 변경




