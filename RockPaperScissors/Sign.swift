//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Maxim Van Meerhaeghe on 16/06/2020.
//  Copyright © 2020 Mixam. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    
    switch sign {
    case 0:     return .rock
    case 1:     return .paper
    default:    return .scissors
    }
}

enum Sign: Int {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:     return "👊"
        case .paper:    return "✋"
        case .scissors: return "✌️"
        }
    }
    
    func playAgainst(otherSign: Sign) -> GameState {
        if self.rawValue == otherSign.rawValue + 1  || self.rawValue + 2 == otherSign.rawValue {
            return .win
        } else if self.rawValue == otherSign.rawValue {
            return .draw
        } else {
            return .lose
        }
    }
}
