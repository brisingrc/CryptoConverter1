//
//  Converter.swift
//  CryptoConverter
//
//  Created by Мак on 10/31/19.
//  Copyright © 2019 Aidar Zhussupov. All rights reserved.
//

import Foundation



class Converter {
    var baseQuote: Quote
    
    init(baseQuote: Quote) {
        self.baseQuote = baseQuote
    }
    
    func convertQuote(amount: Double, convertQuote: Quote)-> String{
        let result = amount * convertQuote.price_usd / baseQuote.price_usd
        let string = String(format: "%.2f", result)
        
        
        return string
    }
   
    
}
