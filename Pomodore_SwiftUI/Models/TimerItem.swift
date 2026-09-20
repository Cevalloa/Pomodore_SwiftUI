//
//  TimerItem.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//
import Foundation

struct TimerItem: Identifiable {
    let id: Int
    
    var accumulatedTime: TimeInterval = 0
    var runningSince: Date?
}
