
import Foundation

public extension KeyedDecodingContainerProtocol {
    
    func decode<Type: Decodable>(for key: Key) throws -> Type {
        try decode(Type.self, forKey: key)
    } 
    
    func decodeIfPresent<Type: Decodable>(for key: Key) throws -> Type? {
        try decodeIfPresent(Type.self, forKey: key)
    } 
}

public extension UnkeyedDecodingContainer {
    
    mutating func decode<Type: Decodable>() throws -> Type {
        try decode(Type.self)
    } 
    
    mutating func decodeIfPresent<Type: Decodable>() throws -> Type? {
        try decodeIfPresent(Type.self)
    } 
}

public extension SingleValueDecodingContainer {
    
    mutating func decode<Type: Decodable>() throws -> Type {
        try decode(Type.self)
    } 
}
