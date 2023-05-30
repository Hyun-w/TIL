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