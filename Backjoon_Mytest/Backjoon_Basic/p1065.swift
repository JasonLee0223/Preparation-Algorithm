//
//  p1065.swift
//  Backjoon_Basic
//
//  Created by 이건행 on 2022/07/25.
//

import Foundation

//MARK: 1065번
func num1065() -> Int {
    let inputValue = Int(readLine()!)!
    var cnt = 0
    
    for i in 1...inputValue{ // 어떤 입력값이 들어오던 100부터 시작하여 입력값까지 반복
        if i < 100 {
            // 1의 자리 수와 10의 자리 수까지는 비교할 대상이 없으므로 예외처리로 cnt를 해준다.
            cnt += 1
        }else{
            oneNum(i)
        }
    }
    
    func intToStringArr(_ n: Int) -> [String] {
        var arrString = [String]()
        
        print(n)
        
        for i in String(n) { // int로 들어온 값을 String형태로 바꿔서 반복문 실행
            arrString.append("\(i)")
        }
        return arrString
    }
    
    func oneNum(_ n:Int){
        
        let num = intToStringArr(n)
        let gap = Int(num[0])!-Int(num[1])!
        for i in 2...num.count-1{
            if  gap != Int(num[i-1])!-Int(num[i])!{
                return
            }
        }
        cnt += 1
    }
    return cnt
}
