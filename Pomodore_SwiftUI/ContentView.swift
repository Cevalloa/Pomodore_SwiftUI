//
//  ContentView.swift
//  Pomodore_SwiftUI
//
//  Created by Alex Cevallos on 9/20/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var items = (1...50).map {
        TimerItem(id: $0)
    }

    var body: some View {
        NavigationStack {
            List($items) { $item in
                TimerRow(item: $item)
            }
        }
    }
}

#Preview {
    ContentView()
}
