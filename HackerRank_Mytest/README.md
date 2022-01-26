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
<img src = "https://user-images.githubusercontent.com/92699723/151105591-b0e0ca5b-aa23-4f3c-9d23-5cdc266b132d.jpg" width="300" height="200"/>

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
Given a time in **12**-hour AM/PM format, convert it to military (24-hour) time.   
주어진 시간 **12**-시간 AM/PM 형식 , 군사(24시간제) 시간으로 변환합니다.   
Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.   
- 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.   
Example
- s = **'12:01:00PM"**   
  Return '12:01:00'.   
- s = **'12:01:00AM'**   
  Return '00:01:00'.   

#### **Function Description**
Complete the timeConversion function in the editor below.   
It should return a new string representing the input time in 24 hour format.   
(입력 시간을 나타내는 새 문자열을 24시간 형식으로 반환해야 합니다.)   
timeConversion has the following parameter(s):   
- string s: a time in **12** hour format   
#### **Returns**
- string: the time in **24** hour format
#### Input Format
A single string  that represents a time in **12**-hour clock format (i.e.: **hh:mm:ssAM** or **hh:mm:ssPM**).   
#### **Constraints**
- All input times are valid
#### **Sample Input 0**
```
07:05:45PM
```
#### **Sample Output 0**
```
19:05:45
```

### 📝 문제풀이
<img src = "https://user-images.githubusercontent.com/92699723/151113426-ac6a7118-8aa5-4aa2-ad74-684be8f82db9.jpg" width="300" height="200"/>   

### 🧑🏼‍💻 코드 작성
```Swift
func timeConversion(s: String) -> String {
    // Write your code here
    guard let hh = Int(s.prefix(2)) else {
        fatalError("Wrong Time Sentence")
    }
    var onlyTime = String(s.dropLast(2))
    
    if s.hasSuffix("PM"), hh < 12 {
        onlyTime = String(onlyTime.dropFirst(2))
        onlyTime = "\(hh+12)\(onlyTime)"
    } else if s.hasSuffix("AM"), hh == 12 {
        onlyTime = String(onlyTime.dropFirst(2))
        onlyTime = "00\(onlyTime)"
    }
    
    //print(onlyTime)
    return onlyTime
}
//timeConversion(s: "07:05:45AM")
```
***
## 📋 이상한 문자 만들기
### 📜 문제내용      

### 📝 문제풀이

### 🧑🏼‍💻 코드 작성

***
## 📋 K번째 수
### 📜 문제내용   

### 📝 문제풀이

### 🧑🏼‍💻 코드 작성