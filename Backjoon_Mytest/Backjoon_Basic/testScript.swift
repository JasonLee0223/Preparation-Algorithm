//
//  testScript.swift
//  Backjoon_Basic
//
//  Created by 이건행 on 2021/12/20.
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

//MARK: 1000번
func num1000() {
    let line = readLine()!
    let lineArr = line.components(separatedBy: " ")
    let a = Int(lineArr[0])!
    let b = Int(lineArr[1])!
    print(a+b)
}

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

//MARK: 1052번
func num1052() {
    
}
