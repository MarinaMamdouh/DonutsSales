//
//  SalesChartView.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import SwiftUI
import Charts

struct SalesChartView: View {
    let data:[Sales]
    
    var body: some View {
        Chart(data) { element in
            BarMark(
                x: .value("Kind", element.name),
                y: .value("Sales", element.sales)
            )
        }
        .padding(5)
        .frame(height: 300)
    }
}

struct SalesChartView_Previews: PreviewProvider {
    static var previews: some View {
        SalesChartView(data: Sales.coffee())
    }
}
