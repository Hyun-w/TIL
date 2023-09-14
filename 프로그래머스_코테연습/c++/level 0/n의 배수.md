# 코드

    #include <string>
    #include <vector>

    using namespace std;

    int solution(int num, int n) {
        if(num%n!=0) return 0;    
        else return 1;
    }

# 피드백

    return num%n ? == 0 ? 1:0; 으로 좀더 간결하게 표현 가능하였다.

    또한 num%n==0 의 결과값이 0과 1임을 응용하여 return num%n==0; 만으로도 충분하였다.