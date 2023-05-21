# 1. Future
* Future< String > name 처럼 제네릭 사용가능
  
        void addNumgbers(int n1, n2){
        Future.delayed(Duration(seconds: 3),(){
            print('$n1 + $n2 = ${n1+n2}');
        });
        print('$n1 + $n2 code end');
        }


        void main(){
        addNumgbers(1,1); 

        /*
        1 + 1 code end
        1 + 1 = 2
        */
        }
        
* async await
 
        Future<void> addNumgbers(int n1, n2) async {
        print('code start');
        await Future.delayed(Duration(seconds: 3),(){
            print('$n1 + $n2 = ${n1+n2}');
        });
        print('$n1 + $n2 code end');
        }

        void main(){ 
        addNumgbers(1,1);
        addNumgbers(2,2);
        }

        /*res
        code start
        code start
        1 + 1 = 2
        1 + 1 code end
        2 + 2 = 4
        2 + 2 code end
        */

        void async main(){ 
        await addNumgbers(1,1);
        await addNumgbers(2,2);
        }

        /*res
        code start
        1 + 1 = 2
        1 + 1 code end
        code start
        2 + 2 = 4
        2 + 2 code end
        */

* Future.wait()   
    Future로 구성된 리스트를 매개변수로 사용   

    Future.wait에 입력된 모든 요소는 동시에 입력되며 끝날때까지 await

        final task = <Future>[];

        await Future.wait(task);


# 2. Stream
* Future는 한번만
* Stream는 지속적으로
* dart:async 패키지 필수
* StreamController()와 .listen을 등록하여 사용

        import 'dart:async';
        
        void main(){
            final controller = SteamController();
            final stream = controller.stream;

            final steamListener1 = stream.listen((val){
                print(val);
            });

            controller.sink.add(1);
            controller.sink.add(2);
        }

## 브로드캐스팅
* Stream 은 한번만 listen
* stream.asBroadcastStream(); 으로 가져오면 복수의 리스너가 동시에 listen하도록 등록 가능

        final stream = controller.stream.asBroadcastStream();

        final streamListener1 = stream.listen((val){
            //do1
        });

        final streamListener2 = stream.listen((val){
            //do2
        });

        controller.sink.add(1);
        controller.sink.add(2);


## 함수로 Stream 반환
* Future는 async로 함수 선언 return으로 반환
* Stream은 async*로 함수 선언 yield로 반환
  
        import 'dart:async';

        Stream<String> cal(int n) async*{
            for(int i=0;i<5;i++){
                yield 'i= $i';
                await Future.delayed(Duration(seconds:1));
            }
        }

        void playStream(){
            cal(1).listen((val){
                print(val);
            });
        }

        void main(){
            playStream();
        }