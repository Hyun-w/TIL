# 0. Flutter Widget
* 플러터에서 화면에 보이는 UI관련된 요소는 전부 위젯으로 이루어져있음
# 1. Child vs Children
* child 매개변수 : 단 하나의 위젯 입력가능
* children 매개변수 : 리스트를 입력 받고 그 리스트 안에 원하는 만큼의 위젯 입력 가능

# 2. 텍스트 관련 위젯
* 화면에 글자를 렌더링 할수 있는 위젯 
* 우선 Text 위젯만 다룸

        Text (
            'text',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
            ),
        )

# 3. 제스처 관련 위젯
* 플러터에선 사용자가 키보드로 글자를 입력하는 행위 외의 모든 입력을 제스처라고 함 (탭하거나 길게 누르거나 등등)
* GestureDetector 위젯은 모든 제스처를 매개변수로 제공
* 제스처 관련 위젯은 하위 위젯에 제스처가 입력됐을 때 인지하고 콜백함수를 실행


1. Button
   1. TextButton: 텍스트만 있는 버튼

            TextButton(
                onPressed () {},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                ),
                child: Text('Text Button'),
            ),

   2. OutlineButton: 테두리가 있는 버튼
   
            OutlineButton(
                onPressed () {},
                style: OutlineButton.styleFrom(
                    foregroundColor: Colors.red,
                ),
                child: Text('Outline Button'),
            ),

   3. ElevatedButton: 입체적으로 튀어나온 느낌의 배경이 들어간 버튼

            ElevatedButton(
                onPressed () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                ),
                child: Text('Elevated Button'),
            ),

2. IconButton
   * 아이콘을 버튼으로 생성하는 위젯
   * 아이콘은 글리프 기반의 아이콘을 사용가능
   * Icons 클래스를 통해 기본 제공 아이콘 사용가능
  
            IconButton(
                onPressed () {},
                icon: Icon(
                    // https://fonts.google.com/icons 에서 기본제공 아이콘 확인 가능
                    Icons.home,
                ),
            )

3. GestureDetector
   * 손가락으로 하는 여러 입력을 인지하는 위젯
  
            GestureDetector(
                onTap: (){
                    print('on Tap');// 디버깅 상 확인가능
                },
                onDoubleTap: (){
                    print('on DoubleTap');
                },
                onLongPress(){
                    print('on long press');
                },
                onPanStart(){
                        //수평 또는 수직 드래그 시작
                },
                onPanUpdate(){  
                        //수평 또는 수직 드래그를 하는 동안 드래그 위치가 업데이트 될때마다
                },
                onPanEnd(){
                        //수평 또는 수직 드래그 끝
                },
                onHorizontalDragStart(){
                        //수평
                },
                onHorizontalDragUpdate(){

                },
                onHorizontalDragEnd(){

                },
                onVerticalDragStart(){
                        //수직
                },
                onVerticalDragUpdate(){

                },
                onVerticalDragEnd(){

                },
                onScaleStart(){
                        //확대
                },
                onScaleUpdate(){

                },
                onScaleEnd(){

                },

                //제스처를 적용할 위젯
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                    ),
                    width: 100.0,
                    height: 100.0,
                ),
            )

4. FloatingActionButton
* Material Design에서 추구하는 버튼 형태
* 화면 오른쪽 아래에 동그란 플로팅 작업 버튼
* FloatingActionButton과 Scaffold를 같이 사용하여 구현
  
        class FloatingActionButtonExample extends StatelessWidget{
            @override
            Widget build(BuildContext context) {
                return MaterialApp(
                    home: Scaffold(
                        floatingActionButton: FloatingActionButton(
                            onPressed: () {},
                            child: Text('클릭'),
                        ),
                        body: Container(),                            
                    ),
                );
            }
        }

# 4. 디자인 관련 위젯
* 배경을 추가하거나 간격을 추가하거나 패딩을 추가하는 등 디자인적 요소를 적용할때 사용
1. Container 위젯
    * 다른 위젯을 담는 용도
    * 위젯의 높이나 너비를 지정하거나 배경이나 테두리를 추가할 때 사용
  
            Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                        width: 16.0,
                        color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(
                        16.0,
                    ),
                ),
                height: 200.0,
                width: 100.0,
            )

2. SizedBox 위젯
    * 일정 크기의 공간을 여백으로 두고 싶을 때 사용
    * Container 위젯을 사용해도 동일한 효과를 얻을 수 있음
    * SizedBox 위젯의 경우 const 생성자를 사용하여 퍼포먼스 이점을 얻을 수 있음
   
            SizedBox(            
                height: 200.0,
                width: 100.0,
                child: Container(
                    color: Colors.red,
                ),
            )

3. Padding 위젯
   * child 위젯에 여백을 두고 싶을때 사용
   * Padding 위젯의 상위 위젯과 하위 위젯 사이의 여백을 둘수 있음
   * padding 매개변수에는 EdgeInsets 라는 값을 입력해야함
   * child 매개변수에 Padding 을 적용하고 싶은 위젯을 입력 가능
  
            Container(
                color: Colors.blue,
                child: Padding(
                    padding: EdgeInsets.all(
                        16.0,
                    ),
                    child: Container(
                        color: Colors.red,
                        width: 50.0,
                        height: 50.0,
                    ),
                ),
            )

    ### 3-1. Margin
    * 패딩은 적용된 위젯이 차지하는 크기 내부에서 간격이 추가
    * 위젯의 바깥에 간격을 추가하는 마진이라는 기능도 있음
    * 마진은 따로 위젯이 존재하지않고 Container 위젯에 추가할수 있음
    
            Container( // 마진이 적용되는 대상
                color: Colors.black,
                child: Container(
                    color: Colors.blue,
                    margin: EdgeInsets.all(16.0),
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                            color: Colors.red,
                            width: 50,
                            height: 50,
                        ),
                    ),
                ),
            )
    
    ### 3-2. EdgeInsets 클래스
    * 다양한 생성자를 제공
    1. EdgeInsets.all(16.0) : 상하 좌우 패딩을 균등하게 적용
    2. EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0) : 가로와 세로 따로 적용
    3. EdgeInsets.only(top: 16.0, bottom: 16.0, left:16.0, right:16.0) : 상하좌우 각각 적용
    4. EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0): 상하좌우 각각 적용 각 순서에 맞게 값 입력해줌

4. SafeArea 위젯
   * 현대 핸드폰이 다양한 형태로 나옴
   * 대표적으로 아이폰의 노치
   * 노치 같은 요소에 위젯이 가리지 않게 SAFE 한 영역에서만 위젯을 그릴수 있도록 함
     
            SafeArea(
                top: true,
                bottom: true,
                left: true,
                right: true,
                child: Container(
                    color: Colors.red,
                    height: 300.0,
                    width: 300.0,
                ),
            ),

# 5. 배치 관련 위젯
* 가로 또는 세로로 배치하거나 위젯 위에 위젯을 겹칠 때 사용
1. Row 위젯
   * 위젯을 가로로 배치
   * 가로가 main 축, 세로가 cross 축
   * children 

            import 'package:flutter/material.dart';

            void main(){
            runApp(RowWidgetExample());
            }

            class RowWidgetExample extends StatelessWidget {
            @override
            Widget build(BuildContext context){
                return MaterialApp(
                home: Scaffold(
                    body: SizedBox(
                    height: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.red,
                        ),
                        const SizedBox(width: 12.0),
                        Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.green,
                        ),
                        const SizedBox(width: 12.0,),
                        Container(
                            height: 50.0,
                            width: 50.0,
                            color: Colors.blue,
                        ),
                        ],
                    ),
                    ),
                    ),
                );
            }
            }

   * MainAxisAlignment 옵션
        1. .start : 시작에 정렬
        2. .center : 중앙에 정렬
        3. .end : 끝에 정렬
        4. .spaceBetween : 자식 위젯 간의 간격을 균등하게 정렬
        5. .spaceAround : 균등하게 배정하고 양끝을 간격의 반만큼 배정해 정렬
        6. .spaceEvenly : 양끝과 위젯의 간격을 균등하게 정렬
   
    * CrossAxisAlignment 옵션
        1. .start : 시작에 정렬
        2. .center : 중앙에 정렬
        3. .end : 끝에 정렬
        4. .stretch : 반대축 최대한 늘려서 정렬

2. Column 위젯
    * Row 위젯의 매개변수와 동일하나, 하나 주축과 반대축이 반대
  
3. Flexible 위젯
   * Row나 Column 위젯 안에 사용 하는 위젯
   * Flexible 위젯의 child가 얼만큼의 공간을 차지할지 지정가능
   * flex: 1 이 Default
   * fit: FlexFit.tight 남은 공간 전부 차지
   * fit: FlexFit.loose 자신이 필요한 공간만 차지
    
            Column(
                children:[
                    Flexible(
                        flex: 1, //default 1
                        child: Container(
                            color: Colors.blue,
                        ),
                    ),
                    Flexible(
                        child:
                        Container(
                            color: Colors.red,
                        ),
                    )
                ],

            ),
  * Flexible 이 필요한 이유
  * children 위젯 은 앞부터 공간이 할당되어 뒤 위젯의 공간이 부족해 에러가 날수 있음
  * Flexible을 적절히 활용하면 이를 방지할수 있음
4. Expanded 위젯
    * Flexible 위젯을 상속하는 위젯
    * fit: FlexFit.tight가 기본값
    * Flexible과 마찬가지로 flex매개변수의 값에 따라 비율 조절 가능
5. Stack 위젯
   * 위젯을 겹치는 기능
   * 두께감 X, 위젯위에 위젯을 올린 느낌 O 
   * 코드상 앞 위젯부터 밑에 깔림
