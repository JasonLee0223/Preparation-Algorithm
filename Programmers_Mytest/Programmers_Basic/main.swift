//
//  main.swift
//  Programmers_Basic
//
//  Created by 이건행 on 2022/01/19.
//

import Foundation

// 예시
// board = 인형뽑기기계, moves = 크레인이 움직일 순서를 담은 배열
// board [ [0,0,0,0,0] - 맨 위,
//         [0,0,1,0,3],
//         [0,2,5,0,1],
//         [4,2,4,4,2],
//         [3,5,1,3,1] - 멘 아래 ]

// moves [ 1,5,3,5,1,2,1,4 ]
// 조건1 - 같은 모양(숫자) 2개가 연속될 때 바구니 비교하여 소멸시킨다. (소멸 후 뒷자리 요소를 앞으로 땡겨와야한다)
// 조건2 - 빈 공간에 크레인이 꺼내려하면 아무일도 일어나지않는다.
// 조건3 - 바구니의 크기에는 제한이 없다.

let input = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let clain = [ 1,5,3,5,1,2,1,4 ]

func solution(board: [[Int]], moves:[Int]) -> Int {
    var cpBoard = board
    var missingDollsCnt = 0
    var basket = [Int]()                                        // 크레인이 추출한 값을 보관하는 곳
    let boardAllCount = cpBoard.count * cpBoard.count
    
    // 제한사항 예외처리
    if cpBoard.count < 5 || cpBoard.count > 30 {
        print("잘못된 보드 크기입니다. 5이상 30 이하로 입력하세요")
        return -1
    }
    if clain.count < 1 || clain.count > 1000 {
        print("잘못된 크레인 순서 크기입니다. 1이상 1000 이하로 입력하세요")
        return -2
    }
    
    for index in moves {
        for index2Board in 0..<cpBoard.count {                              // 각 행(indexX)의 같은 열을 탐색하기 위해 행의 갯수만큼 반복
            if cpBoard[index2Board][index - 1] != 0 {                       // 첫 번째 행부터 i번째 index가 0인지 확인한다.
                if basket.last == cpBoard[index2Board][index-1]{            // 인형이 있는 경우 basket의 마지막 값과 비교한다.
                    missingDollsCnt += 2                                    // basket 마지막 값과 같은 경우 지워주고 count+2
                    basket.removeLast()
                } else {
                    basket.append( cpBoard[index2Board][index-1] )
                }
                cpBoard[index2Board][index - 1] = 0                         // board에 있던 인형이 옮겨짐으로 '0'으로 표시
                break
            }
        }
    }
    
    return missingDollsCnt
}
print(solution(board: input, moves: clain))
