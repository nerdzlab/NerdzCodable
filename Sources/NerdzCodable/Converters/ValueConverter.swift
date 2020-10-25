//
//  ValueConverter.swift
//  NerdzCodable
//
//  Created by new user on 25.10.2020.
//

import Foundation

public struct ConvertedValue<FromType: Codable, ToType, ConverterType: ValueConverter<FromType, ToType>>: Codable {
    
    private enum Errors: Error {
        case canNotMapToType
        case canNotMapFromType
    }
    
    public let value: ToType
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(FromType.self)
        
        if let value = ConverterType.convert(rawValue) {
            self.value = value
        }
        else {
            throw Errors.canNotMapToType
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let rawValue = ConverterType.convert(value) {
            try container.encode(rawValue)
        }
        else {
            throw Errors.canNotMapFromType
        }
    }
}

public class ValueConverter<FromType, ToType> {
    public class func convert(_ value: FromType) -> ToType? {
        nil
    }
    
    public class func convert(_ value: ToType) -> FromType? {
        nil
    }
}
