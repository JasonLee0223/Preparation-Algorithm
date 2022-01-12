//
//  main.swift
//  Leetcode_Basic
//
//  Created by 이건행 on 2022/01/12.
//

import Foundation

let inputValue = Int(readLine()!)!

func reverse(_ x: Int) -> Int {
    var input = x
    var negative = 1
    var result = 0
    
    if input < 0 {
        input = input * -1
        negative = -1
    }
    
                                        // ex. input = 123
    while input > 0 {                   // input값이 '0'되면 탈출
        var value = input % 10          // 1의 자릿수까지 구하기 ex.123 -> 3 / 12 -> 2
        input = input / 10              // 10의 자릿수로 나눠지는 몫값 구하기 ex. 12 -> 1
        result = result * 10 + value    // 결과값 만들기 3 -> 32 ->321
        //print("===\(result)")
    }
    
    result = result * negative
    if (result > Int32.max || result < Int32.min) {
        result = 0
    }
    
    return result
}
print(reverse(inputValue))
