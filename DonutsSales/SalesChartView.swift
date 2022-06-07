//
//  SalesChartView.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import SwiftUI
import Charts

enum ChartStyle{
    case Bar
    case Line
}

struct SalesChartView: View {
    
    let data:[Sales]
    let style:ChartStyle
    
    var body: some View {

        switch style {
            case .Bar:
                BarChart(_data: data)
            case .Line:
                LineChart(_data: data)
        }
    }
    
    func BarChart(_data:[Sales]) -> some View{
        Chart(data) { element in
            BarMark(
                x: .value("Kind", element.month),
                y: .value("Sales", element.sales)
            )
        }
        .padding(5)
        .frame(height: 200)
    }
    
    func LineChart(_data:[Sales]) -> some View{
        Chart(data) { element in
            LineMark(
                x: .value("Kind", element.month),
                y: .value("Sales", element.sales)
            )
            PointMark(
                x: .value("Kind", element.month),
                y: .value("Sales", element.sales)
            )
        }
        .padding(5)
        .frame(height: 200)
        
    }
}




struct SalesChartView_Previews: PreviewProvider {
    static var previews: some View {
        SalesChartView(data: Sales.coffee(), style:.Line)
    }
}
