//
//  SalesSummaryChartView.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import SwiftUI
import Charts

struct SalesSummaryChartView: View {
    let data:[SalesSummary]
    let style:ChartStyle
    
    var body: some View {

        switch style {
            case .Bar:
                BarChart(_data: data)
            case .Line:
                LineChart(_data: data)
        }
    }
    
    func BarChart(_data:[SalesSummary]) -> some View{
        Chart(data) { summary in
            ForEach(summary.sales){ element in
                BarMark(
                    x: .value("Kind", element.month),
                    y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("Category", summary.category))
            }
            
        }
        .padding(5)
        .frame(height: 200)
    }
    
    func LineChart(_data:[SalesSummary]) -> some View{
        Chart(data) { summary in
            ForEach(summary.sales){ element in
                LineMark(
                    x: .value("Kind", element.month),
                    y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("Category", summary.category))
                PointMark(
                    x: .value("Kind", element.month),
                    y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("Category", summary.category))
            }
        }
        .padding(5)
        .frame(height: 200)
        
    }
}

struct SalesSummaryChartView_Previews: PreviewProvider {
    static var previews: some View {
        SalesSummaryChartView(data: SalesSummary.summary(), style: .Line)
    }
}
