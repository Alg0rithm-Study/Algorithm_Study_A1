//
//  SortingTheSentence.swift
//  LeetCode
//
//  Created by 양호준 on 2022/02/22.
//

import Foundation

// Insertion sort로 해결 -> 다른 풀이로도 풀어보자~

class SolutionSortC {
    func sortSentence(_ s: String) -> String {
        var sentenceElements: [String] = s.components(separatedBy: " ")
        
        for current in 1..<sentenceElements.count {
            for next in  (1...current).reversed() {
                if sentenceElements[next].last!.wholeNumberValue! < sentenceElements[next - 1].last!.wholeNumberValue! {
                    sentenceElements.swapAt(next, next - 1)
                } else {
                    break
                }
            }
        }
        
//        for (index, element) in sentenceElements.enumerated() {
//            let lastWord = sentenceElements[index].last!.wholeNumberValue!
//            if lastWord - 1 != index {
//                sentenceElements.swapAt(lastWord - 1, index) // 이렇게 비교했을 때 "KTFkUVVrmYMSo2 wXlQraUqblfhCfDLK3 IfTuftYVualQ6 NhpQ5 HlRjClVtQrTFcwbx4 fi1" 실패
//            }
//        }
        for index in 0..<sentenceElements.count {
            sentenceElements[index].removeLast()
        }
//        sentenceElements.map { var element in
//            element.removeLast()
//        }
//        sentenceElements.map { $0.removeLast() } // 왜 위에는 되고 이건 안되는걸까?
        print(sentenceElements.joined(separator: " "))
        return sentenceElements.joined(separator: " ")
    }
}
