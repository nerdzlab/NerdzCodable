//
//  File.swift
//  
//
//  Created by Vasyl Khmil on 11.04.2023.
//

import Foundation

public class PreciseDecimalConverter: ValueConverter<String, Decimal> {
    
    public override class func convert(_ value: String) -> Decimal? {
        Decimal(string: value)
    }
    
    public override class func convert(_ value: Decimal) -> String? {
        value.description
    }
}

public class PreciseDecimal: ConvertedValue<String, Decimal, PreciseDecimalConverter> {
    
}
