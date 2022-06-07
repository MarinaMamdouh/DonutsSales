//
//  Sales.swift
//  DonutsSales
//
//  Created by Marina on 07/06/2022.
//

import Foundation

struct Sales:Identifiable{
    var id = UUID()
    var month:String
    var sales:Int
}


extension Sales{
    static func donuts()-> [Sales]{
        return [
            Sales(month: "Jan.", sales: 900),
            Sales(month: "Feb.", sales: 1432),
            Sales(month: "Mar.", sales: 376),
            Sales(month: "Apr.", sales: 897),
            Sales(month: "May", sales: 145)
        ]
    }
}

extension Sales{
    static func coffee()-> [Sales]{
        return [Sales(month: "Jan.", sales: 1324),
                Sales(month: "Feb.", sales: 898),
                Sales(month: "Mar.", sales: 567),
                Sales(month: "Apr.", sales: 2908),
                Sales(month: "May", sales: 389)
        ]
    }
}
