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
    @State var showBoth:Bool = false
    
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
                
                PickerView("Item", selection: $menuItem)
                
                SalesChartView(data: data)
                
                ButtonView(showBoth ? "show Bar chart" : "Show line chart")

                Spacer()
            }
            .navigationTitle("Sales")
        }
    }
    
    func ButtonView(_ text:String)-> some View{
        Button {
            showBoth.toggle()
        } label: {
            Text(text)
        }
    }
    
    func PickerView(_ name:String, selection:Binding<Menu>)-> some View{
        
        Picker(name, selection:selection.animation(.easeInOut)) {
            Text("Donuts").tag(Menu.Donuts)
            Text("Coffee").tag(Menu.Coffee)
        }
        .pickerStyle(.segmented)
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
