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
    @State var showBar:Bool = true
    @State var showBoth:Bool = false
    var style:ChartStyle {
        return (showBar ? ChartStyle.Bar : ChartStyle.Line)
    }
    
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
            
            VStack(spacing: 20) {
                
                PickerView("Item", selection: $menuItem)
                
                SalesChartView(data: data, style: style)
                
                ButtonView(showBar ? "Show Line Chart" : "Show Bar Chart")
                
                ToggleView("Show All In One Chart", isOn: $showBoth)
                
                SummaryChartView( SalesSummary.summary(), style: style ,isShown: showBoth)

                Spacer()
            }
               .navigationTitle("Sales")
        }
    }
    
    func SummaryChartView(_ data:[SalesSummary], style:ChartStyle, isShown:Bool)-> some View{
        SalesSummaryChartView(data: data, style: style)
            .opacity(isShown ? 1 : 0)
    }
    
    func ToggleView(_ title:String, isOn:Binding<Bool>)-> some View{
        Toggle(title, isOn: $showBoth)
            .padding(20)
    }
    
    func ButtonView(_ text:String)-> some View{
        Button {
            withAnimation {
                showBar.toggle()
            }
 
        } label: {
            Text(text)
                .foregroundColor(.black)
        }
        .padding(10)
        .background( Color.init(uiColor: UIColor.systemMint) )
        .cornerRadius(5)
        
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
