# 문법

# 1. 헤더

Header 1
===

Header 2
---

# H1
## H2
###### H6 6까지 지원   

# 2. 블록인용
> 블록인용
> 테스트
> > 내부블록
> 테스트
> 테스트
> > 테스트
> > >테스트
> 123

# 3. 목록
1. 첫번쨰
3. 두번쨰 
2. 세번째
4. 4. 무조건 내림차순

* 1
* 2
* 3

+ 1
+ 2
+ 3

- 1
- 2
- 3
  
1. 가나다
   - 한국어
   1. 혼합 및 indent 가능

# 4. 코드
코드 블록  엔터후 indent 

    if is code
    this is code
        if
        end
    end

end code 

사용언어 표시

```java
public class BootSpringBootApplication {
  public static void main(String[] args) {
    System.out.println("Hello, Honeymon");
  }
}
```

# 5. 수평선
---
***
- - -
* * *

# 6. 링크
* [link keyword 구글][id]

[id]: URL "https://google.com"

* code Link: [Google Display][googlelink]

[googlelink]: https://google.com "Go google 마우스"

* [Google](https://google.com, "google link")
  
* 외부링크: <http://example.com/>
  
* 이메일링크: <address@example.com>
  
# 7. 강조
강조*강조*강조
조강_조강_조강

강조*강조*강조

# 8. 이미지

![Alt text](/path/to/img.jpg)

![Alt text](/path/to/img.jpg "Optional title")

<img src="/path/to/img.jpg" width="450px" height="300px" title="px(픽셀) 크기 설정" alt="RubberDuck"></img><br/>

<img src="/path/to/img.jpg" width="40%" height="30%" title="px(픽셀) 크기 설정" alt="RubberDuck"></img>

# 9. 줄바꿈
* 줄 바꿈을 하기 위해서는 문장 마지막에서 3칸이상을 띄어쓰기해야 한다.
이렇게

* 줄 바꿈을 하기 위해서는 문장 마지막에서 3칸이상을 띄어쓰기해야 한다.띄어쓰기 스페이스 세번   
* 이렇게