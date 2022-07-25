//
//  p1009.swift
//  Backjoon_Basic
//
//  Created by 이건행 on 2022/07/25.
//

import Foundation

//MARK: 1009번
//1 6 =      1
//3 7 = 218  7
//6 2 = 3    6
//7 100 = ...1 -> 범위초과오류 발생
//9 635 = ...9 -> 범위초과오류 발생
func num1009() {
    var result = [Int]()
    let testCaseNum = Int(readLine()!)!
    
    for _ in 1...testCaseNum
    {
        let comNumAndDataNumArr = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let comNum = comNumAndDataNumArr[0]     // 1
        var dataNum = comNumAndDataNumArr[1]    // 6
        // 1의 자릿수는 최대 4주기를 갖고있지만 나머지가 '0'인 경우를 위해 '+4' 추가
        dataNum = dataNum % 4 +  4                            // 2
        var multipleNum = 1
        
        for _ in 1...dataNum{
            multipleNum *= comNum % 10         // 27
            multipleNum = multipleNum % 10
        }
        //print("multipleNum = \(multipleNum)")
        result.append(multipleNum)
    }
    // COM10 의 경우 '0' 으로 출력됨으로 출력값이 10인 부분을 예외처리
    for result in result {
        if result == 0 {
            print(10)
        } else {
            print(result)
        }
    }
}
