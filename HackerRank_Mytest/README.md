# HackerRank Algorithm Problem

## 📋 Diagonal Difference
### 📜 문제내용   
Given a square matrix, calculate the absolute difference between the sums of its diagonals.   
(정사각 행렬이 주어지면 대각선의 합 사이의 절대 차이를 계산합니다.)   
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
(대각선 차이는 다음 매개변수를 사용합니다.)   
- int arr[n][m]: an array of integers   
#### **Return**
- int: the absolute diagonal difference
#### **Input Format**
The first line contains a single integer, ***n***,   
(첫 번째 줄에는 단일 정수가 포함되어 있습니다. )   
the number of rows and columns in the square matrix ***arr***.   
(정방 행렬의 행과 열 개수)    
Each of the next  lines describes a row, ***arr[i]***,   
(각각의 다음 라인은 행을 설명하고)   
and consists of ***n*** space-separated integers ***arr[i][j]***.  
(및 구성 ***n*** 공백으로 구분된 정수 ***arr[i][j]***) 

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

### 📝 문제풀이
![알고리즘 연습장-4](https://user-images.githubusercontent.com/92699723/151105217-354bbcd8-fe5d-401d-ab0a-e00fc19c7ef9.jpg){: width="50" height="50"}

### 🧑🏼‍💻 코드 작성
```Swift
func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var leftLine = 0
    var rightLine = 0
    
    for i in 0..<arr.count {
        leftLine += arr[i][i]
        rightLine += arr[i][arr.count-1-i]
    }
    
    return abs(leftLine - rightLine)
}
```
***
## 📋 Time Conversion
### 📜 문제내용   
Given a time in -hour AM/PM format, convert it to military (24-hour) time.   
Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.   
- 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.   
Example
- s = '12:01:00PM"   
  return '12:01:00'.
Return '12:01:00'.

Return '00:01:00'.
Function Description
Complete the timeConversion function in the editor below. It should return a new string representing the input time in 24 hour format.
timeConversion has the following parameter(s):
string s: a time in  hour format
Returns
string: the time in  hour format
Input Format
A single string  that represents a time in -hour clock format (i.e.:  or ).
Constraints
All input times are valid
Sample Input 0
07:05:45PM
Sample Output 0
19:05:45

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