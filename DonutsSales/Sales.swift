//
//  Sales.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import Foundation

struct Sales:Identifiable{
    var id = UUID()
    var name:String
    var sales:Int
}


extension Sales{
    static func donuts()-> [Sales]{
        return [
            Sales(name: "Cream Boston", sales: 900),
            Sales(name: "Original Donut", sales: 1432),
            Sales(name: "Caramel Donut", sales: 376),
            Sales(name: "Chocolate Donut", sales: 897),
            Sales(name: "Strawbery Donut", sales: 145)
        ]
    }
}

extension Sales{
    static func coffee()-> [Sales]{
        return [Sales(name: "Cappcinuo", sales: 1324),
                Sales(name: "Latte", sales: 898),
                Sales(name: "Flat White", sales: 567),
                Sales(name: "Americano", sales: 2908),
                Sales(name: "Machiato", sales: 389)
        ]
    }
}
