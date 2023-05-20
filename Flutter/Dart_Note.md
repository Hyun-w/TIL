# 1. 클래스 class

1. 생성자   
   * 인스턴스를 생성하는 method
   * 입력받을 변수는 주로 final로 생성하여 인스턴스화 이후 변경을 막음
2. 네임드 생성자
   * 생성자.fromMap(Map<String, dynamic> map) : , ; 방식
3. 프라이빗 변수
   * class 내부에 _변수로 선언 // ex. String _name
   * 타 언어와 달리 클라스 내부가 아니라 같은 파일 내 접근가능

4. 게터 세터
   * get set 키워드를 사용하여 표시   
   * String _name = ''; 일 때
   * 세터 set name(String name){ this._name = name;} 형식
   * 게터 String get name{return this._name;} 형식   
    콜할때 ex.name;

# 2. 상속 inheritance

    class Child extends Parent{
       child(String a, int b,) : super( a, b,);
    }

# 3. 오버라이드 Override

        child(super.a, super.b,);

        @override   // 생략은 가능하지만 유지보수 불리
        함수();

# 4. 인터페이스 interface

* 반드시 모든 기능 재정의
* 상속과 달리 갯수 제한없음
* implements 와 , 사용해 나열   

        class Child implements Parent1, Parent2...{
            final Stirng name;
            Child(this.name);
        }

# 5. 믹스인 Mixin
* 상속과 믹스인의 차이점
    1. 상속은 모든 속성을 물려받아야함
    2. 믹스인은 취사선택가능
* 특정 클래스에서 원하는 기능들만 넣어둠
* 갯수 제한없음
* mixin 이름 on 과 , 사용해 나열
  
        mixin Mixin1 {
            void fun0(){
                print("abc");
            }
        }
        mixin Mixin2 on Parent{
            void fun1(){
                print('${this.a}'); 
            }
        }

        class Child extends Parent with Mixin1, Mixin2{
            Child(super.a);
        }

# 6. 추상 abstract

* 인스턴스화 불가능하도록 함
* 상속이나 인터페이스로만 사용가능 
* child 클래스 에서 모든 method를 재정의 해줘야함

# 7. 제네릭 generic
* Map< type >, List< type > 처럼 <>으로 나타냄
* 클래스나 함수의 정의를 인스턴스화 시킬때로 미룸
* 주 표기법
    1. T 변수 타입 type // T val;
    2. E 리스트 내부 요소들의 타입 ele// List< E >;
    3. K 키값 key // Map< K, V >; 
    4. V 값 val

        class Cache<T>{
            final T data;

            Cache({required this.data,});
        }

        void main(){
            final cache = Cache<List<int>>(data :[1,2,3],);
        }

# 8. 스태틱 static

* 클래스 자체에 귀속되어 다른 인스턴스와 공유

        class Class{
            static int a = 0;
        }

# 9. 캐스케이드 연산자 cascade operator
* ..기호를 사용, 인스턴스에서 사용되는 방법
* 선언한 변수의 메소드를 연속하여 실행

        void main(){
            Class instance = Class('K',V)
            ..fun1()
            ..fun2();
        }