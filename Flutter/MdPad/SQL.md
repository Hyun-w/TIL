# SQL 문법

1. CREATE TABLE   
테이블을 생성할 때 사용
   
    CREATE TABLE (이름) {
        이름 속성,
        이름 속성,
    }

    CREATE TABLE product{
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name VARCHAR NOT NULL,
        quantity INT DEFAULT 0,
        price INT NOT NULL,
    }

2. INSERT INTO
특정 테이블에 행을 삽입할 때 사용

    INSERT INTO 테이블이름 (삽입할 값들의 열)
    VALUES (삽입할 값);

    INSERT INTO product(name, quantity, price)
    VALUES ('김치',20,50000);

AUTOINCREMENT 키워드 때문에 id 값은 알아서 생성함

3. SELECT
데이터를 선택할 때 사용
. 을 사용하여 나열, * 사용 시 해당 행 전체

    SELECT * FROM product WHERE id = 1;

1,'김치',20,50000 값이 불러와짐

4. UPDATE
업데이트 때 사용

    UPDATE 테이블이름 SET 변경할열이름=변경할값 WHERE 변경될 위치;

    UPDATE product SET quantity = 100 WHERE id =1;

김치 재고가 20에서 100개로 변경됨

5. DELETE
특정 행을 삭제할때 사용

    DELETE FROM 테이블 WHERE 변경될 위치; 해당 행 삭제

    DELETE FROM 테이블; 테이블의 모든 데이터 삭제


# Drift 플러그인

객체 - 관계 모델   
객체 관계 매핑 (Object Relation Mapping, ORM)   
객체-관계 매핑은 데이터베이스의 구조와 객체를 매핑해주는 기술   
위의 예제 처럼 테이블을 만들었다면, 해당 속성이 있는 클래스를 생성하여 테이블과 매핑함   
이를 통해 쿼리를 실행하고 응답을 받을때 정형화된 테이블 클래스의 인스턴스 형태로 결과를 리턴 받을수 있음   

1. CREATE TABLE
   
    import 'package:drift/drift.dart';
    
    class Product extends Table {
        IntColumn get id => integer().autoIncrement()();
        TextColumn get name => text()();
        IntColumn get quantity => integer().withDefault(const Constant(0))();
        IntColumn get price => integer().nullable()();
    }

2. INSERT INTO

    Future<int> addProduct(){
        return int(product).insert(
            ProductCompanion(
                name: Value('김치'),
                quantity: Value(20),
                price: Value(50000),
            ),
        );
    }

3. SELECT

    Future<ProductData> getProduct(){
        return (select(product)..where((t) => t.id.equals(1))).getSingle();
    }

4. UPDATE

    Future<int> updateProduct(){
        return (update(product)
            ..where(
                (t) => t.id.equals(1),
            ))
                .where(
                    ProductCompanion(
                        quantity: Value(100),
                    ),
                );
    }

5. DELETE

    Future<int> deleteProduct(){
        return (delete(product)..where((t)=> t.id.equals(1))).go();
    }