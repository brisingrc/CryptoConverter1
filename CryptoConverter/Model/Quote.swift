//
//  Quote.swift
//  CryptoConverter
//
//  Created by Мак on 10/31/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation
import UIKit



struct Quote: CustomStringConvertible {
    
    var id: String
    var name: String
    var symbol: String
    var rank: String
    var price_usd: Double
    var price_btc: Double
    var h_volume_usd: Double
    var market_cap_usd: Double
    var available_supply: Double
    var total_supply: Double
    var max_supply: Int
    var percent_change_1h: Double
    var percent_change_24h: Double
    var percent_change_7d: Double
    var last_updated: NSDate
    var image : UIImage?
    
    
  
        
    var description: String {
           return self.fullName
       }

       var fullName: String {
           return "Валюта:\(symbol) \(name),\(price_usd)" + "\n"
       }
    
    
    static func convertToString(_ yourArray: Array<Quote>) -> String {
        var string = ""
        for i in yourArray.indices{
            string += yourArray[i].name + ", " + String(format: "%.3f", yourArray[i].price_usd) + "\n"
        }
        return string
    }
    
//    func bitQuote()-> Quote {
//        let bt: Quote
//        bt.id = "bitcoin"
//        bt.name = "Bitcoin"
//        bt.symbol = "BTC"
//        bt.rank = "1"
//        bt.price_usd = 10201.0994019
//        bt.price_btc =  1.0
//        bt.h_volume_usd = 15754522367.5
//         bt.market_cap_usd = 182598781597
//        bt.available_supply = 17899912.0
//        bt.total_supply = 18026187.0
//        bt.max_supply = Int(21000000.0)
//        bt.percent_change_1h = -0.12
//        bt.percent_change_24h = -1.33
//        bt.percent_change_7d = 1.65
//        bt.last_updated = NSDate(timeIntervalSince1970: 1566924809)
//        bt.image = UIImage(named: "btc.png")!
//        return bt
//    }
}


