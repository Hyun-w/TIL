# 코드

    #include <string>
    #include <vector>

    using namespace std;

    string solution(int q, int r, string code) {
        string answer = "";
        for(int i=0;i<code.length();i++){
            if(i%q==r) answer.push_back(code[i]);
        }
        return answer;
    }

# 피드백

    i=r, i+=q 로 건너뛰면 더 효율적이었다.