//
//  Time-Conversion.swift
//  HackerRank_Basic
//
//  Created by 이건행 on 2022/01/26.
//

import Foundation

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

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
