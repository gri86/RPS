//
//  Sign.swift
//  RPS2
//
//  Created by byteCode on 11/06/2019.
//  Copyright © 2019 Григорий Пигаев. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSing() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return.rock
    } else if sign == 1 {
        return.paper
    } else {
        return.scissors
    }
}


enum Sign{
    case rock, paper, scissors
    
    var emoji: String{
        switch self {
        case .paper:
            return "👋🏻"
        case .rock:
            return "✊🏻"
        case .scissors:
            return "✌🏻"
        }
    }
    
    func takeTurn(_oposite : Sign) -> GameState{
        switch self {
        case .rock:
            switch _oposite {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch _oposite {
            case .rock:
                return .win
            case .paper:
                return .draw
            case .scissors:
                return .lose
            }
        case .scissors:
            switch _oposite {
            case .rock:
                return .lose
            case .paper:
                return .win
            case .scissors:
                return .draw
            }
        }
    }
}
