//
//  Sign.swift
//  RPS
//
//  Created by Алексей Грачев on 12.02.2022.
//

import Foundation
import GameplayKit
let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randdomSign() -> Sign {
    let sign = randomChoise.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
enum Sign {
    case rock, paper, scissors
    var emoji: String {
        switch self {
        case .paper:
            return "👋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    func getResult(for opposite: Sign) -> GameState {
        switch (self, opposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}
