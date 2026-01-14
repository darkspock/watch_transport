//
//  Arrival.swift
//  WatchTrans Watch App
//
//  Created by Juan Macias Gomez on 14/1/26.
//

import Foundation

struct Arrival: Identifiable, Codable {
    let id: String
    let lineId: String
    let lineName: String
    let destination: String   // "Aranjuez"
    let scheduledTime: Date
    let expectedTime: Date    // May differ if delayed
    let platform: String?

    // Delay calculation
    var isDelayed: Bool {
        expectedTime > scheduledTime
    }

    var delayMinutes: Int {
        guard isDelayed else { return 0 }
        return Int(expectedTime.timeIntervalSince(scheduledTime) / 60)
    }

    // Minutes until arrival
    var minutesUntilArrival: Int {
        let interval = expectedTime.timeIntervalSinceNow
        return max(0, Int(interval / 60))
    }

    // Display string for arrival time
    var arrivalTimeString: String {
        let minutes = minutesUntilArrival

        if minutes == 0 {
            return "Now"
        } else if minutes == 1 {
            return "1 min"
        } else {
            return "\(minutes) min"
        }
    }

    // Progress value for progress bar (0.0 to 1.0)
    // Assumes max display is 30 minutes
    var progressValue: Double {
        let minutes = Double(minutesUntilArrival)
        let maxMinutes = 30.0
        return max(0, min(1.0, 1.0 - (minutes / maxMinutes)))
    }
}
