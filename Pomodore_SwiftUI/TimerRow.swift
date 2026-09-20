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
            Text("Item \(item.id)")

            Spacer()

//            timerText.monospacedDigit()
            timerText
        }.onAppear {
            start()
        }.onDisappear {
            pause()
        }
    }

    @ViewBuilder
    private var timerText: some View {
        if let runningSince = item.runningSince {

            let startDate = runningSince.addingTimeInterval(
                -item.accumulatedTime
            )

            Text(
                .currentDate,
                format: .stopwatch(
                    startingAt: startDate,
                    showsHours: true,
                    maxFieldCount: 2,
                    maxPrecision: .seconds(1)
                )
            )
        } else {
            Text(
                item.accumulatedTime,
                format: .number.precision(.fractionLength(1))
            )

        }
    }

    private func start() {
        guard item.runningSince == nil else {
            return
        }

        item.runningSince = .now
    }

    private func pause() {
        guard let runningSince = item.runningSince else {
            return
        }

        item.accumulatedTime += Date.now.timeIntervalSince(runningSince)
        item.runningSince = nil
    }
}
