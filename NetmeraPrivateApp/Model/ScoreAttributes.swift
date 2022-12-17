//
//  ScoreAttributes.swift
//  NetmeraPrivateApp
//
//  Created by Elif Yürektürk on 3.11.2022.
//

import SwiftUI
import ActivityKit

struct ScoreAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable{

        var estimatedDeliveryTime: Date
        var teamAScore = "1"
        var teamBScore = "0"
        var text = "Second half-time started"
    }
    
   
}

