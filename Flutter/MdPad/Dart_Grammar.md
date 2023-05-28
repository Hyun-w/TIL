# 1. 변수
1. var 타입 추론 후 고정
2. dynamic 변수 타입 변경간으
3. final 런타임 고정
4. const 빌드타임 고정
   
# 2. 변수 타입
1. String 문자열
2. int
3. double
4. bool
   
# 3. 컬렉션
## 1. List   
   List<String> name = ['1','3'];

   * add
   * where   
 
         final newList = name.where(
          (name) => name == '1' || name =='2',
         );
         print(newList.toList());

   * map

         final newMap = name.map(
            (name) => 'Add $name',
         );
         print(newMap.toList());
   
   * reduce   
   리스트의 첫 값을 val 이후 값들을 ele로 순회

         final newReduce = name.reduce(
            (val,ele)=> val + ',' + ele
            );
         
   * fold    
   순회, 리스트 요소 타입이 달라도댐

         final newFold = name.fold<int>(0/*초기값*/, (val,ele) => val +ele.length);

## 2. Map
*   Map<키의 타입, 값의 타입>
## 3. Set
*    Set<타입>
## 4. enum

      enum Status {
         approved,
         pending,
         rejected,
      }

      Status status = Status.approved;
      print(status);//res= Status.approved

## 5. 연산자
* 타입 뒤에 ? 명시 하여야 null가능

      double? num1 = null;
      double? num2;//자동으로 null      

* null assertion 연산자 !   
 null type의 변수를 선언하고 이 변수에는 절대로 null이 대입되지 않는 다고 확신할 경우   
 변수! 를 사용

* ??를 사용하여 null일때만 값 저장 가능

      num1 ??= 3;//3 할당
      num1 ??= 4;// 3이 이미 있으므로 3유지

      print(num1>num2); // true or false 값

* is / is! 연산자   
  변수 타입 확인

* 논리 연산자   
  
      bool res = 12 > 10 && 1<0; //false

## 6. 제어문
* if
* switch
* for
* while
* do while


## 7. 함수와 람다

      List<int> num = [1,2,3,4,5];

      final allnum1 = num.reduce( (val,ele){
         return val+ele;
      });

      final allnum2 = num.reduce( (val,ele)=> val+ele);

## 8. typedef
   * 함수 선언
  
         typedef Op = void fun(int y, int x);

         void add(int y, int x){
            print('res= ${y+x}');
         }
      
         void sub(int y, int x){
            print('res= ${y-x}');
         }

         Op op = add;
         op(1,2); // 3
         op = sub;
         op(1,2); // -1

   * 플리터에선 함수를 객체처럼 사용가능 매개변수로 활용
   
         void cal(int y, int x, Op op){
            op(y,x);
         }

         cal(1,2,add); // 3
## 9. try catch

      try{

      }catch(e){

      }