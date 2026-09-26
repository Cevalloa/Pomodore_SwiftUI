//
//  ContentView.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//

import SwiftUI

struct ContentView: View {
    @State var items = (1...50).map { index in
        TimerItem()
    }

    var body: some View {
        List($items) { item in
            TimerRow(item: item)
        }
    }
}

#Preview {
    ContentView()
}
