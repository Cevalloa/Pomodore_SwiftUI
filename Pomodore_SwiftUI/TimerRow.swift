//
//  TimerRow.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//

import SwiftUI

struct TimerRow: View {

    @Binding var timerItem: TimerItem

    var body: some View {

        VStack {
            if let timeSince = timerItem.timeSince {

                let startTime = timeSince.addingTimeInterval(-timerItem.totalTime)

                Text(
                    .currentDate,
                    format: .stopwatch(
                        startingAt: startTime,
                        showsHours: true,
                        maxFieldCount: 2,
                        maxPrecision: .milliseconds(100)
                    )
                )
            } else {
                let minutes = Int(timerItem.totalTime) / 60
                let seconds = Int(timerItem.totalTime) % 60
                
                Text(String(format:"%02d:%02d", minutes, seconds))
//                Text(timerItem.totalTime, format: .number.precision(.fractionLength(1)))
            }
        }.onAppear {
            if !timerItem.isUserPaused {
                start()
            }
        }.onDisappear {
            pause()
        }.onTapGesture {
            togglePause()
        }
    }

    func togglePause() {
        
        if timerItem.isUserPaused {
            start()
        } else {
            pause()
        }
        
        timerItem.isUserPaused = !timerItem.isUserPaused
    }
    
    func start() {
        guard timerItem.timeSince == nil else {
            return
        }
        
        timerItem.timeSince = .now
    }
    
    func pause() {
        guard let timeSince = timerItem.timeSince else {
            return
        }
        timerItem.totalTime += Date.now.timeIntervalSince(timeSince)
        timerItem.timeSince = nil
    }
}
