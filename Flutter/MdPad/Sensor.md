# 1. Sensor_plus 패키지

    import 'package:sensors_plus/sensors_plus.dart';

    // 중력을 반영한 가속도계 값
    accelerometerEvents.listen((AccelerometerEvent event){
        print(event.x);
        print(event.y);
        print(event.z);
    });

    // 중력을 반영하지 않은 사용자의 힘에 의한 가속도계 갑
    userAccelerometerEvent.listen((UserAccelerometerEvent event){
        print(event.x);
        print(event.y);
        print(event.z);
    });

    // 자이로센서 값
    gyroscopeEvent.listen((GyroscopeEvent event){
        print(event.x);
        print(event.y);
        print(event.z);
    });

* shake 패키지를 사용해 정규화 과정을 스킵