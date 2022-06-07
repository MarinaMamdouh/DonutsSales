//
//  SalesSummary.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import Foundation

struct SalesSummary:Identifiable{
    var id:String { self.category }
    var category: String
    var sales:[Sales]
}


extension SalesSummary{
    static func summary()->[SalesSummary]{
        return [
            SalesSummary(category: "Donuts", sales: Sales.donuts()),
            SalesSummary(category: "Coffee", sales: Sales.coffee())
        ]
    }
}
