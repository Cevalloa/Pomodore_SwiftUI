//
//  ContentView.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//

import SwiftUI

struct ContentView: View {

    @State var items: [TimerItem] = (1...50).map { _ in
        TimerItem()
    }
    var body: some View {
        List($items) { $item in
            TimerRow(timerItem: $item)
        }
    }
}

#Preview {
    ContentView()
}
