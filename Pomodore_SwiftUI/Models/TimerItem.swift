//
//  TimerItem.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//
import Foundation

struct TimerItem: Identifiable {
    let id = UUID()
    
    var totalTime: TimeInterval = 0
    var timeSince: Date?
    var isUserPaused = false

}
