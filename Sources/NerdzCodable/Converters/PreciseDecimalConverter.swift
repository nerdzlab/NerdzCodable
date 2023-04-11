//
//  File.swift
//  
//
//  Created by Vasyl Khmil on 11.04.2023.
//

import Foundation

public class PreciseDecimalConverter: ValueConverter<Double, Decimal> {
    
    public override class func convert(_ value: Double) -> Decimal? {
        let string = String(value)
        return Decimal(string: string)
    }
    
    public override class func convert(_ value: Decimal) -> Double? {
        NSDecimalNumber(decimal: value).doubleValue
    }
}

public class PreciseDecimal: ConvertedValue<Double, Decimal, PreciseDecimalConverter> {
    
}
