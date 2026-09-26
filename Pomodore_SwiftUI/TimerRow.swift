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

        HStack {
            if let startedAt = item.startedAt {
                let timeToStart = startedAt.addingTimeInterval(
                    -item.elapsedTime
                )

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

                Circle().frame(width: 12, height: 12).phaseAnimator([false, true ]) { circle, phase in
                    circle.opacity(phase ? 0.2 : 1.0)
                } animation: { _ in
                    .easeInOut(duration: 0.5)
                }

            } else {
                let minutes = Int(item.elapsedTime) / 60
                let seconds = Int(item.elapsedTime) % 60

                Text(String(format: "%02d:%02d", minutes, seconds))
            }
        }.onAppear {
            if !item.isPaused {
                start()
            }
        }.onDisappear {
            pause()
        }.onTapGesture {
            togglePause()
        }
    }

    func togglePause() {
        if item.isPaused {
            start()
        } else {
            pause()
        }

        item.isPaused.toggle()
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
