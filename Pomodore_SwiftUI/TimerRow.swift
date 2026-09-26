//
//  TimerRow.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//

import SwiftUI

struct TimerRow: View {

    @Binding var item: TimerItem

    var body: some View {

        VStack {
            if let startedAt = item.startedAt {
                let timeToStart = startedAt.addingTimeInterval(-item.elapsedTime)

                Text(
                    .currentDate,
                    format:
                        .stopwatch(
                            startingAt: timeToStart,
                            showsHours: true,
                            maxFieldCount: 3,
                            maxPrecision: .milliseconds(100)
                        )
                )

            } else {
                let minutes = Int(item.elapsedTime) / 60
                let seconds = Int(item.elapsedTime) % 60

                Text(String(format: "%02d:%02d", minutes, seconds))
            }
        }.onAppear {
            start()
        }.onDisappear {
            pause()
        }
    }

    func start() {
        guard item.startedAt == nil else {
            return
        }

        item.startedAt = .now
    }

    func pause() {
        guard let startedAt = item.startedAt else {
            return
        }

        item.elapsedTime += Date.now.timeIntervalSince(startedAt)
        item.startedAt = nil
    }
}
