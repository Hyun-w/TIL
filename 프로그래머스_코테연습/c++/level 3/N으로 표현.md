# 코드

    #include <string>
    #include <vector>
    using namespace std;
    vector<vector<int>>V(9,vector<int>());
    int dp(int N, int number, int dep){
        if(dep==9) return -1; 
        if(number==V[dep-1][0]*10+N) return dep;
        V[dep].push_back(V[dep-1][0]*10+N);    
        for(int a=1;a<dep;a++){
            int b=dep-a;
            for(int i=0;i<V[a].size();i++){
                for(int j=0;j<V[b].size();j++){
                    if(V[a][i]+V[b][j]!=number) V[dep].push_back(V[a][i]+V[b][j]);
                    else return dep;
                    if(V[a][i]-V[b][j]!=number) V[dep].push_back(V[a][i]-V[b][j]);
                    else return dep;
                    if(V[a][i]*V[b][j]!=number) V[dep].push_back(V[a][i]*V[b][j]);
                    else return dep;
                    if(V[b][j]){
                        if(V[a][i]/V[b][j]!=number) V[dep].push_back(V[a][i]/V[b][j]);
                        else return dep;                
                    }
                }
            }
        }    
        return dp(N,number,dep+1);    
    }
    int solution(int N, int number) {    
        if(N==number) return 1;
        V[1].push_back(N);
        return dp(N,number,2);
    }

# 피드백

    dp 어렵다...
    의외로 3중 for문을 돌아도 시간초과가 발생하지 않았다.
    dp라고 return 으로만 해결하란 법 없다.
    dp에도 이중 배열 사용하여도 시간 초과 안나네.
    N=(1+n-1)+(2+n-2)...(n-2+2)+(n-1+1) 을 전부 구하여 해결.
    number->N으로 다운 방법으론 안됨
    DP 는 확실히 1->number로 카운터업할것.