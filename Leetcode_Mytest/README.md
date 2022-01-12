# Leetcode Algorithm Problem
## 📋 1.two-sum
### 📜 문제내용   
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.   
**정수 nums의 배열과 정수 대상이 주어지면 대상에 합산되는 두 숫자의 인덱스를 반환합니다.**

You may assume that each input would have exactly one solution, and you may not use the same element twice.   
**각 입력에 정확히 하나의 솔루션이 있다고 가정하고 동일한 요소를 두 번 사용하지 않을 수 있습니다.**

You can return the answer in any order.   
어떤 순서로든 답변을 반환할 수 있습니다.   

### 💻 풀이내용
1. 합해서 ```target```이 되는 ```nums``` Array의 두 수를 찾고, 그 수들의 index를 찾아서 리턴하는것이다.
2. 이중 반복문을 통하여 첫 번째 반복문에서 배열 요소를 정한 후 두 번째 반복문에서 배열 요소를 순차적으로 앞의 값과 덧셈 연산을 통하여 ```target```과 동일한 결과값을 도출해낸다.
3. 전체 코드
```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] { 
        for i in 0..<nums.count { 
            for j in i+1..<nums.count { 
                if nums[i] + nums[j] == target { 
                    return [i,j] 
                } 
            } 
        } 
        return [] 
    } 
```
***
## 📋 7. Reverse Integer
### 📜 문제내용
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.   
부호 있는 32비트 정수 x가 주어지면 숫자가 반전된 x를 반환합니다.   
 x를 반전하면 값이 부호 있는 32비트 정수 범위 [-231, 231 - 1]를 벗어나면 0을 반환합니다.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).   
 **환경에서 64비트 정수(부호가 있거나 없는)를 저장할 수 없다고 가정합니다.**

 ### 💻 풀이내용
 1. 입력된 정수```x```를 뒤집어 출력한다.
 2. 입력된 정수의 끝자리가 '0'인 경우 표시되지않는다.
 3. 부호값을 따로 두어 음수를 표현할 수 있도록한다.
```swift
var negative = 1

if input < 0 {
        input = input * -1
        negative = -1
    }
```
4. 입력값을 10으로 계속 나누어 각 자릿수의 나머지와 몫을 구하여 역순을 취한다.
```swift
                                    // ex. input = 123
while input > 0 {                   // input값이 '0'되면 탈출
    var value = input % 10          // 1의 자릿수까지 구하기 ex.123 -> 3 / 12 -> 2
    input = input / 10              // 10의 자릿수로 나눠지는 몫값 구하기 ex. 12 -> 1
    result = result * 10 + value    // 결과값 만들기 3 -> 32 ->321
    }
```
5. 32bit를 넘지 않기 위하여 조건문 추가한다.
```swift
if (result > Int32.max || result < Int32.min) {
    result = 0
}
```
***
## 📋 83. Remove Duplicates from Sorted List
### 📜 문제내용
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.   
정렬된 연결 목록의 Head가 주어지면 각 요소가 한 번만 나타나도록 모든 중복 항목을 삭제합니다. 정렬된 연결 목록도 반환합니다.   

```swift
// Example1
Input: head = [1,1,2]
Output: [1,2]
// Example2
Input: head = [1,1,2,3,3]
Output: [1,2,3]
```
### 💻 풀이내용
1. 입력되는 head의 값이 nil일 때 nil을 반환하는 조건문 선언한다.
2. 입력된 head값을 node 변수에 저장하여 반복문을 사용할 수 있게한다.
3. node?.next가 nil이 아닐 때까지 반복문을 돈다.
   1. 현재node의 val != 다음node의 val이 같은 경우
   2. 현재node를 다음 node의 포인터로 지정
   3. node를 다음 node로 치환
4. 반복이 끝난 후 전체 linkedlist인 head 반환