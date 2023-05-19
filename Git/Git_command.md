# Git command

# 1. git config
최초 설정   
git config --global user.name "123"   
git config --global user.email "123"   

확인    
git config --global --list

에디터 설정   
git config --global core.editor ""

# 2. git repository
1. git init 저장소로 등록
2. git clone 가져오기

# 3. git status
git status 명령어로 상태 확인가능   
1. untracked : 관리대상이 아님
2. unmodified : commit 이후 수정이 안됨
3. modified : 수정
4. staged : modified 된 파일을 git에 올리기 위한 상태 
   
# 4. git add
staged 상태로 변경   
* git add README
* git add *.c
* git add .
  
# 5. git commit
staged 상태를 커밋함

# 6. git push
commit 상태를 업로드함   
git push <저장소 이름> <브랜치 이름>

# 7. git pull / fetch
저장소 에서 데이터를 가져옴   
* pull 자동 merge   
* fetch 수동 merge

# 8. git remote
* git remote   
  저장소 위치 확인
* -v   
  이름 + url 확인
* add {저장소 이름} {url}   
  저장소 추가
* rename {now} {new}   
  저장소 이름 변경
* remove paul   
  삭제

# 9. git branch
  
1. git branch name   
   name 브랜치 생성    
2. git checkout   
   브랜치 이동
   * -b   
      브랜치를 만들면서 이동
3. git branch -d {대상}   
   브랜치 삭제
4. git branch   
   정보
5. -a   
   로컬/리모트 저장소의 branch
6. -r   
   리모트 저장소의 branch
7. -m   
  이름 변경

# 10. git merge
마스터로 이동 후 마스터 브랜치에 합침
* git checkout master
* git merge {대상 브랜치}