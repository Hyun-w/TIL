# 1. 콜백 함수
* 일정 작업이 완료되면 실행되는 함수
* 함수를 정의해두면, 바로 실행되지 않고 특정 조건이 성립될때 실행
* ex) 웹뷰의 로딩이 끝났을때 실행

        WebView(
            initialURL: 'https://blog.codefactory.ai',
            javascriptMode: JavascriptMode.unrestricted,

            onPageFinished: (String url){ // 콜백함수
                print(url);
            },
        )

# 2. Timer
Timer는 특정 시간이 지난후 에 일회성 또는 지속적으로 함수를 실행   
Timer의 생성자는 Timer()//일회성 , Timer.periodic()//주기적 두가지 

* Timer.periodic()을 사용하여 주기적으로 콜백 함수를 실행

        Timer.periodic(
            Duration(seconds: 3), // 주기
            (Timer timer){}, // 콜백 함수
        )

* Duration에 days, hours, minutes, seconds, milliseconds, microseconds 매겨변수를 사용하여 주기를 설정
* 주기적으로 콜백 함수를 실행, 매개변수에 현재 실행 중인 Timer 객체가 제공

# 3. setState()
* State를 상속하는 모든 클래스에서 사용가능
* StatefulWidget의 렌더링이 끝나고 클린 상태일때, setState()를 원하는 속성을 변경하여 더티 상태로 변경되고, build() 함수가 실행되어 다시 클린상태로 돌아옴
* setState() 함수는 매개변수 하나를 입력 받음
* 매개변수는 콜백함수이고, 이 콜백함수에 변경하고 싶은 속성들을 입력해주면 해당 코드가 반영된 뒤 build()
* 콜백함수 비동기로 작성되면 안됨

        setState( () {
            number++;
        });

# 4. showCupertinoDialog()
다이얼로그를 실행하는 함수 Cupertino이니 모든 애니메이션과 작동이 iOS스타일

    import 'package:flutter/cupertino.dart';

    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
            return Text('Dialog');
        },
    );


* 위젯을 사용하려면 Cupertino 패키지를 불러와야함
* showCupertinoDialog() 함수를 실행하면, Cupertino 스타일의 다이얼로그 실행 할 수 있음
* showDialog() 형태의 함수들은 BuildContext를 반드시 입력해야함
* 다이얼로그 위젯 위의 흐림처리 된 부분을 barrier 라고 부름
* barrierDismissible가 true 이면 barrier 를 눌렀을때 다이얼로그가 닫힘
* builder()함수에 다이얼로그에 띄우고 싶은 위젯을 return 해주면 댐
