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
    

}


