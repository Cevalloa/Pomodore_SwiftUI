//
//  ContentView.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        List(1...50, id: \.self) { index in
            let startTime = Date.now

            Text(
                TimeDataSource<Date>.currentDate,
                format: .stopwatch(
                    startingAt: startTime,
                    showsHours: true,
                    maxPrecision: .seconds(1)
                )
            )
        }
    }
}

#Preview {
    ContentView()
}
