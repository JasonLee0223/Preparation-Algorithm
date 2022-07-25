//
//  p1000.swift
//  Backjoon_Basic
//
//  Created by 이건행 on 2022/07/25.
//

import Foundation

//MARK: 1000번
func num1000() {
    let line = readLine()!
    let lineArr = line.components(separatedBy: " ")
    let a = Int(lineArr[0])!
    let b = Int(lineArr[1])!
    print(a+b)
}
