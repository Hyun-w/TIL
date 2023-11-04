# 코드

    #include <string>
    #include <vector>
    #include <algorithm>
    using namespace std;

    vector<int> solution(vector<int> arr, int k) {
        vector<int> answer;
        for(auto n:arr){
            if((find(answer.begin(),answer.end(),n)==answer.end())&&(answer.size()<k)){
                answer.push_back(n);
            }
        }
        k-=answer.size();
        while(k-->0){
            answer.push_back(-1);
        }
        return answer;
    }

# 피드백

    set사용시 좀더 효율적이였을듯