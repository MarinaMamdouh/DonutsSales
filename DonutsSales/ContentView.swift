//
//  ContentView.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State var menuItem:Menu = .Donuts
    
    var data:[Sales] {
        switch menuItem {
        case .Donuts:
            return Sales.donuts()
        case .Coffee:
            return Sales.coffee()
        }
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
            
                Picker("Item", selection: $menuItem) {
                    Text("Donuts").tag(Menu.Donuts)
                    Text("Coffee").tag(Menu.Coffee)
                }
                .pickerStyle(.segmented)
                .padding(10)
                
                Chart(data) { element in
                    BarMark(
                        x: .value("Kind", element.name),
                        y: .value("Sales", element.sales)
                    )
                }
            }
            .navigationTitle("Sales")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
