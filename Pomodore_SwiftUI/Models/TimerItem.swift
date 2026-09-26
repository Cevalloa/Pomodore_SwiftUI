//
//  TimerItem.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//
import Foundation

struct TimerItem: Identifiable {
    let id = UUID()
    
    var elapsedTime: TimeInterval = 0
    var startedAt: Date?
}
