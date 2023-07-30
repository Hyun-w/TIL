모바일에서는 SQLite와 하이브를 클라이언트 사이드 데이터베이스로 주로 사용함   
추가로 파이어스토어를 사용해 간단한 서버 사이드 NoSQL데이터베이스 및 API를 구현   

# 하이브
NoSQL DB이면서 in Memory DB   
데이터를 파일에 저장하기 때문에 앱의 생명주기와 상관없이 데이터가 유지되지만 앱이 실행되는 순간 파일에 저장돼 있던 모든 데이텅가 메모리에 올라옴   

1. pubspec.yaml

        dependencies:

        hive:
        hive_flutter:

        dev_dependencies:

        hive_generator:
        build_runner:

    하이브는 코드제네레이션 기능을 지원하기 때문에 build_runner와 hive_generator등 코드제네레이션을 제공하는 플러그인도 추가

2. main() 함수에서 하이브 초기화

        await Hive.initflutter();

3. 하이브의 Box 개념   
SQL에서의 테이블처럼 똑같은 타입의 데이터를 모아두는 공간   
특정 데이터를 저장하고 다루기위해 박스를 열어야 함   
박스를 열때 어떤 타입의 데이터를 저장할지, 박스의 이름을 지정해주면 됨   

        final box = await Hive.openBox<String>('student_name');

    String 타입을 저장할 student_name이라는 명칭을 갖는 박스를 오픈, 이 박스에 접근할 때는 student_name이라는 명칭을 사용하면 되고 String 타입만 저장가능   

4. student_name 박스에 학생 이름을 입력, openBox()함수를 실행해서 반환받는 박스에 add() 함수를 실행해서 값을 추가 가능
   
        box.add('val');
        print(box.toMap());//{0:val}

    add() 함수를 이용하여 박스에 값을 추가하면 자동으로 키값이 배정, 박스의 toMap()함수를 실행하면 키와 값을 Map형태로 반환   

5. 클래스 형태의 데이터 박스에 저장가능

        class Student {
            @HiveField(0)
            final String name;

            @HiveField(1)
            final int age;

            Student({
                required this.name,
                required this.age,
            });

            @override
            String toString(){
                return 'Student(name: $name, age: $age)';
            }
        }

    1. 하이브에 저장될 모든 클래스는 HiveType 어노테이션(annotation)을 사용해서 프로젝트 유일한 typeId를 지정해줘야 함. 한 프로젝트 내 겹치치 않는 숫자   
    2. 추후 클래스의 구조가 변경됐을 때 하이브는 typeId를 기반으로 변경된 클래스를 인지
    3. flutter pub run build_runner build를 실행하여 코드 제네레이션을 실행
    4. 클래스 타입은 추가로 아답터를 등록해줘야함

            Hive.registerAdapter<Student>(StudentAdapter());

        flutter pub run build_runner build를 실행해서 생성된 StudentAdapter를 하이브에 등록   
        
    하이브의 box 객체의 함수들
    1. add(val) : 박스에 값을 추가할 때 사용, 자동으로 키값이 지정
    2. put(key, val) : 박스에 값을 추가할때 사용, 키값을 수동으로 지정
    3. putAt(index,val) : 특정 인데스에 값을 추가 
    4. get(key) : 키를 기반으로 값을 가져옴
    5. getAt(index) : 인덱스를 기반으로 값을 가져옴
    6. delete(key) : 키를 기반으로 값을 삭제
    7. deleteAt(index) : 인덱스를 기반으로 값을 삭제
    8. clear() : 박스 내부의 모든 값들을 삭제

