# HackerRank Algorithm Problem
> 반례를 찾는 것도 알고리즘 능력의 일부이기 때문에 보통 백준(BOJ)을 가장 많이 추천한다.   
> 하지만 우리는 초보니까 친절한 leetcode 같은 사이트로 풀어도 무방.   
> 입문자일 때는 친절한 플랫폼을 사용하고, 좀 더 능숙하게 하고 싶거나 대회를 하고 싶다면 BOJ를 추천   
> atcoder나 codeforce 같은 대회 플랫폼에서 가상 대회도 출전해 보자.   

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
<img src = "https://user-images.githubusercontent.com/92699723/151105591-b0e0ca5b-aa23-4f3c-9d23-5cdc266b132d.jpg" width="400" height="300"/>

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
<img src = "https://user-images.githubusercontent.com/92699723/151113426-ac6a7118-8aa5-4aa2-ad74-684be8f82db9.jpg" width="400" height="300"/>   

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
## 📋 Number Line Jumps
### 📜 문제내용      
You are choreographing a circus show with various animals. For one act, you are given two kangaroos on a number line ready to jump in the positive direction (i.e, toward positive infinity).   
- The first kangaroo starts at location **𝑥1** and moves at a rate of **𝑣1** meters per jump.   
(첫 번째 캥거루는 위치에서 시작합니다. **𝑥1**의 속도로 움직입니다. **𝑣1** 점프 당 미터.)   
- The second kangaroo starts at location **𝑥2** and moves at a rate of **𝑣1** meters per jump.   
(두 번째 캥거루는 다음 위치에서 시작합니다.**𝑥2**의 속도로 움직입니다. **𝑣2** 점프 당 미터.)   
You have to figure out a way to get both kangaroos at the same location at the same time as part of the show.    
(쇼의 일부로 같은 위치에서 두 캥거루를 동시에 얻을 수 있는 방법을 찾아야 합니다.)   
If it is possible, return YES, otherwise return NO.   

#### **Example**    
 **𝑥1** = 2   
 **𝑣1** = 1   
 **𝑥2** = 1    
 **𝑣2** = 2   
After one jump, they are both at **𝑥** = 3, (**𝑥1** + **𝑣1** = 2 + 1, **𝑥2** + **𝑣2** = 1 + 2 ), so the answer is YES.   

#### **Function Description**
Complete the function kangaroo in the editor below.   
kangaroo has the following parameter(s):   
- int 𝑥1, int 𝑣1: starting position and jump distance for kangaroo 1   
- int 𝑥2, int 𝑣2: starting position and jump distance for kangaroo 2   
#### **Returns**
- string: either YES or NO   
#### **Input Format**
A single line of four space-separated integers denoting the respective values of **𝑥1**, **𝑣1**, **𝑥2**, and **𝑣2**.   

#### **Sample Input 0**
```
0 3 4 2
```
#### **Sample Output 0**
```
YES
```   
#### **Explanation 0**
The two kangaroos jump through the following sequence of locations:
<img width="704" alt="스크린샷 2022-01-26 오후 3 49 21" src="https://user-images.githubusercontent.com/92699723/151116293-7dd60f07-836b-471b-8dce-156cc4607bad.png">   

From the image, it is clear that the kangaroos meet at the same location (number **12** on the number line) after same number of jumps (**4** jumps), and we print **YES**.   

#### **Sample Input 1**
```
0 2 5 3
```
#### **Sample Output 1**
```
NO
```

#### **Explanation 1**

The second kangaroo has a starting location that is ahead (further to the right) of the first kangaroo's starting location (i.e.**𝑥2**, **𝑥1**). Because the second kangaroo moves at a faster rate (meaning **𝑣2** > **𝑣1**) and is already ahead of the first kangaroo, the first kangaroo will never be able to catch up. Thus, we print NO.

### 📝 문제풀이
<img src = "https://user-images.githubusercontent.com/92699723/151124097-ec4bfedb-fa6e-470d-8bdf-34d4021eb14d.jpg" width="600" height="600"/>   

### 🧑🏼‍💻 코드 작성
```Swift
func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    // Write your code here
    var realX1 = x1
    var realX2 = x2
    
    while true {
        if v1 <= v2 { return "NO"}
        realX1 = x1 + v1
        realX2 = x2 + v2
        if realX1 == realX2 { return "NO" }
        if realX1 > realX2 { return "YES" }
    }
}
```
***
## 📋 Save the Prisoner!
### 📜 문제내용   
A jail has a number of prisoners and a number of treats to pass out to them.   
Their jailer decides the fairest way to divide the treats is to seat the prisoners around a circular table in sequentially numbered chairs.   
A chair number will be drawn from a hat. Beginning with the prisoner in that chair,   
one candy will be handed to each prisoner sequentially around the table until all have been distributed.   
The jailer is playing a little joke, though. The last piece of candy looks like all the others,   
but it tastes awful. Determine the chair number occupied by the prisoner who will receive that candy.

#### **Example**
 **𝑛** = 4   
 **𝑚** = 6   
 **𝒔** = 2   

There are **4**prisoners, **6**pieces of candy and distribution starts at chair **2**.   
The prisoners arrange themselves in seats numbered **1**to**4**. Prisoners receive candy at positions **2,3,4,1,2,3**.   
The prisoner to be warned sits in chair number**3**.   

#### **Function Description**
Complete the saveThePrisoner function in the editor below. It should return an integer representing the chair number of the prisoner to warn.   

saveThePrisoner has the following parameter(s):   
- int n: the number of prisoners   
- int m: the number of sweets   
- int s: the chair number to begin passing out sweets from   
#### **Returns**   
- int: the chair number of the prisoner to warn
#### **Input Format**   
The first line contains an integer, **𝑡**, the number of test cases.    
The next **𝑡**lines each contain **3** space-separated integers:   
 **𝑛** : the number of prisoners    
 **𝑚** : the number of sweets   
 **𝒔** : the chair number to start passing out treats at   

#### **Sample Input 0**
```
2
5 2 1
5 2 2
```
#### **Sample Output 0**
```
2
3
```
#### **Explanation 0**
In the first query, there are **𝑛 = 5** prisoners and **𝑚 = 2** sweets. Distribution starts at seat number **𝒔 = 1**.   
Prisoners in seats numbered **1** and **2** get sweets. Warn prisoner **2**.   
In the second query, distribution starts at seat **2** so prisoners in seats **2** and **3** get sweets. Warn prisoner **3**.   

#### **Sample Input 1**
```
2
7 19 2
3 7 3
```
#### **Sample Output 1**
```
6
3
```
#### **Explanation 1**
In the first test case, there are **𝑛 = 7** prisoners and **𝑚 = 19** sweets and they are passed out starting at chair **𝒔 = 2**.   
The candies go all around twice and there are **5** more candies passed to each prisoner from seat **2** to seat **6**.   
In the second test case, there are **𝑛 = 3** prisoners and **𝑚 = 17** candies and they are passed out starting at seat **𝒔 = 3**.   
They go around twice, and there is one more to pass out to the prisoner at seat **3**.   

### 📝 문제풀이

### 🧑🏼‍💻 코드 작성