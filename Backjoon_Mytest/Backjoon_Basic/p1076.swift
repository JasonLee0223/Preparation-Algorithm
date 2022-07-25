//
//  p1076.swift
//  Backjoon_Basic
//
//  Created by 이건행 on 2022/07/25.
//

import Foundation

//MARK: 1076번
func num1076() {
    var inputColorArr = [String](repeating: " ", count: 3)
    var colorValueArr = [Int](repeating: 0, count: 3)
    var result = 0
    
    for i in 0...2{
        inputColorArr[i] = String(readLine()!)
    }
    
    for j in 0...2
    {
        switch inputColorArr[j]
        {
        case "black" :
            colorValueArr[j] = 0
        case "brown":
            colorValueArr[j] = 1
        case "red" :
            colorValueArr[j] = 2
        case "orange":
            colorValueArr[j] = 3
        case "yellow" :
            colorValueArr[j] = 4
        case "green":
            colorValueArr[j] = 5
        case "blue" :
            colorValueArr[j] = 6
        case "violet":
            colorValueArr[j] = 7
        case "grey" :
            colorValueArr[j] = 8
        case "white":
            colorValueArr[j] = 9
        default:
            break
        }
    }
    result = ( colorValueArr[0]*10 + colorValueArr[1] ) * Int((pow(10.0, Double(colorValueArr[2]))))
    print(result)
}
