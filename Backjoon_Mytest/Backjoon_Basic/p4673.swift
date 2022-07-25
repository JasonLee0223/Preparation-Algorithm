//
//  p4673.swift
//  Backjoon_Basic
//
//  Created by 이건행 on 2022/07/25.
//

import Foundation

// MARK: 4673번
func num4673() -> Void {
    // Set 빈 배열을 선언
    var storageSet: Set<Int> = []
    
    for inputNum in 1...10000 {
        storageSet.insert( selfNumber(inputNum) )
    }
    
    for realSelfNum in 1...1000 {
        if !storageSet.contains(realSelfNum){
            print(realSelfNum)
        }
    }
    
    func selfNumber(_ inputNumOfSet: Int) -> Int {
        var constructor = inputNumOfSet, digit = inputNumOfSet
        
        while digit != 0 {
            constructor += digit % 10   // 각 자리수(digit % 10 을 하는 이유)를 더해야 결과값을 확인 할 수 있기 때문
            digit /= 10     // ex. 33 -> 33 + 3 + 3(digit /= 10)
        }
        return constructor
    }
}
