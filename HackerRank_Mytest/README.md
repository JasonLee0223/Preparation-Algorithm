# HackerRank Algorithm Problem

## 📋 Diagonal Difference
### 📜 문제내용   
Given a square matrix, calculate the absolute difference between the sums of its diagonals.
For example, the square matrix  is shown below:
```
1 2 3
4 5 6
9 8 9
```  
The left-to-right diagonal = 1 + 5 + 9 + 15. The right to left diagonal = 3 + 5 + 9 = 17.   
Their absolute difference is |15 - 17| = 2.   
#### **Function description**
Complete the ***diagonalDifference*** function in the editor below.
diagonalDifference takes the following parameter:
- int arr[n][m]: an array of integers   
#### **Return**
- int: the absolute diagonal difference
#### **Input Format**
The first line contains a single integer, ***n***, the number of rows and columns in the square matrix ***arr***.    
Each of the next  lines describes a row, ***arr[i]***, and consists of  space-separated integers ***arr[i][j]***.   

#### **Constraints**
- -100 ≤ arr[i][j] ≤ 100

#### **Output Format**
Return the absolute difference between the sums of the matrix's two diagonals as a single integer.   

#### **Sample Input**
```
3
11 2 4
4 5 6
10 8 -12
```
#### **Sample Output**
```
15
```
#### **Explanation**
The primary diagonal is:
```
11
   5
     -12
```
Sum across the primary diagonal: 11 + 5 - 12 = 4   
The secondary diagonal is:
```
     4
   5
10
```
Sum across the secondary diagonal: 4 + 5 + 10 = 19   
Difference: |4 - 19| = 15
**Note**: |x| is the absolute value of x

### 🧑🏼‍💻 코드 작성
```Swift
import Foundation

// 예시
// board = 인형뽑기기계, moves = 크레인이 움직일 순서를 담은 배열
// board [ [0,0,0,0,0] - 맨 위,
//         [0,0,1,0,3],
//         [0,2,5,0,1],
//         [4,2,4,4,2],
//         [3,5,1,3,1] - 멘 아래 ]

// moves [ 1,5,3,5,1,2,1,4 ]
// 조건1 - 같은 모양(숫자) 2개가 연속될 때 바구니 비교하여 소멸시킨다. (소멸 후 뒷자리 요소를 앞으로 땡겨와야한다)
// 조건2 - 빈 공간에 크레인이 꺼내려하면 아무일도 일어나지않는다.
// 조건3 - 바구니의 크기에는 제한이 없다.

let input = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let clain = [ 1,5,3,5,1,2,1,4 ]

func solution(board: [[Int]], moves:[Int]) -> Int {
    var cpBoard = board
    var missingDollsCnt = 0
    var basket = [Int]()                                        // 크레인이 추출한 값을 보관하는 곳
    let boardAllCount = cpBoard.count * cpBoard.count
    
    // 제한사항 예외처리
    if cpBoard.count < 5 || cpBoard.count > 30 {
        print("잘못된 보드 크기입니다. 5이상 30 이하로 입력하세요")
        return -1
    }
    if clain.count < 1 || clain.count > 1000 {
        print("잘못된 크레인 순서 크기입니다. 1이상 1000 이하로 입력하세요")
        return -2
    }
    
    for index in moves {
        for index2Board in 0..<cpBoard.count {                              // 각 행(indexX)의 같은 열을 탐색하기 위해 행의 갯수만큼 반복
            if cpBoard[index2Board][index - 1] != 0 {                       // 첫 번째 행부터 i번째 index가 0인지 확인한다.
                if basket.last == cpBoard[index2Board][index-1]{            // 인형이 있는 경우 basket의 마지막 값과 비교한다.
                    missingDollsCnt += 2                                    // basket 마지막 값과 같은 경우 지워주고 count+2
                    basket.removeLast()
                } else {
                    basket.append( cpBoard[index2Board][index-1] )
                }
                cpBoard[index2Board][index - 1] = 0                         // board에 있던 인형이 옮겨짐으로 '0'으로 표시
                break
            }
        }
    }
    
    return missingDollsCnt
}
print(solution(board: input, moves: clain))
```
***
## 📋 모의고사
### 📜 문제내용   
수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다.   
수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...   
2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...   
3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...   
1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때,   
가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

### 📝 문제풀이
1번 수포자는 1, 2, 3, 4, 5 를 주기로 찍는다.   
2번 수포자는 2, 1, 2, 3, 2, 4, 2, 5 를 주기로 찍는다.   
3번 수포자는 3, 3, 1, 1, 2, 2, 4, 4, 5, 5 를 주기로 찍는다.   
문제 수만큼 반복하면서 정답 배열의 요소와 비교하여 가장 많이 문제를 맞춘 사람이 누구인지 배열에 담아 return한다.   

1) 위 3명의 수포자를 각각 배열로 선언한다.
2) 답안지 배열 요소만큼 반복하면된다.
3) 가장 많이 문제를 맞춘 수포자를 넣기위한 배열 생성 및 오름차순으로 정렬
4) 첫번째 답을 기준으로 주어진 수포자 배열의 값을 한바퀴씩 다 돌아야한다.

### 🧑🏼‍💻 코드 작성
```swift
func solution(_ answers:[Int]) -> [Int] {
    var collectionStudent = [Int]()
    var score = [0, 0, 0]
    
    // 1) 위 3명의 수포자를 각각 배열로 선언한다.
    let looser1 = [1, 2, 3, 4, 5]
    let looser2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let looser3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    // 2) 답안지 배열 요소만큼 반복하면된다.
    for i in 0..<answers.count {
        // 첫번째 답을 기준으로 주어진 수포자 배열의 값을 한바퀴씩 다 돌아야한다.
        if answers[i] == looser1[i%5] { score[0] += 1 }
        if answers[i] == looser2[i%8] { score[1] += 1 }
        if answers[i] == looser3[i%10] { score[2] += 1 }
    }
    
    for i in 0...2 {
        if score.max() == score[i] {
            collectionStudent.append(i+1)
        }
    }
    
    return collectionStudent.sorted()
}
print(solution([1,2,3,4,5]))
print(solution([1,3,2,4,2]))
```
***
## 📋 이상한 문자 만들기
### 📜 문제내용   
문자열 s는 한 개 이상의 단어로 구성되어 있습니다.   
각 단어는 하나 이상의 공백문자로 구분되어 있습니다.   
각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.   

### 📝 문제풀이

### 🧑🏼‍💻 코드 작성

***
## 📋 K번째 수
### 📜 문제내용   
배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.   
예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면
array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.   
1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.   
2에서 나온 배열의 3번째 숫자는 5입니다.   
배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때,   
commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.   

<img width="532" alt="스크린샷 2022-01-19 오후 5 03 22" src="https://user-images.githubusercontent.com/92699723/150088954-40061ad6-30f2-46b8-8fb6-2592314e8605.png">

### 📝 문제풀이

### 🧑🏼‍💻 코드 작성