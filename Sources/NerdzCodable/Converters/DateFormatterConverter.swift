//
//  DateFormatterConverter.swift
//  NerdzCodable
//
//  Created by new user on 25.10.2020.
//

import Foundation

public protocol DateFormatterContainer {
    static var formatter: DateFormatter { get }
}

public struct FormattedDate<ContainerType: DateFormatterContainer>: Codable {
    
    private enum Errors: Error {
        case canNotDecode
    }
    
    public var date: Date
    
    public init(date: Date) {
        self.date = date
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        if let date = ContainerType.formatter.date(from: string) {
            self.date = date
        }
        else {
            throw Errors.canNotDecode
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let string = ContainerType.formatter.string(from: date)
        try container.encode(string)
    }
}
