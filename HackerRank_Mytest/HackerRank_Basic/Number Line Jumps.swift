//
//  Number Line Jumps.swift
//  HackerRank_Basic
//
//  Created by 이건행 on 2022/01/26.
//

import Foundation

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
