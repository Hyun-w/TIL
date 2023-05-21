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