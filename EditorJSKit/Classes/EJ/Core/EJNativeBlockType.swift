//
//  EJNativeBlockType.swift
//  EditorJSKit_Example
//
//  Created by Ivan Glushko on 12/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

///
public protocol EJAbstractBlockType: Codable {
    var rawValue: String { get }
    init?(rawValue: String)
    func decode(container: KeyedDecodingContainer<EJAbstractBlock.CodingKeys>) throws -> EJAbstractBlockType
    func encode(container: inout KeyedEncodingContainer<EJAbstractBlock.CodingKeys>) throws
}

///
public enum EJNativeBlockType: String, EJAbstractBlockType {
    case header
    case image
    case list
    case linkTool
    case delimiter
    case paragraph
    case raw
    
    public func decode(container: KeyedDecodingContainer<EJAbstractBlock.CodingKeys>) throws -> EJAbstractBlockType {
        return try container.decode(EJNativeBlockType.self, forKey: .type)
    }
    
    public func encode( container: inout KeyedEncodingContainer<EJAbstractBlock.CodingKeys>) throws {
        try container.encode(self, forKey: .type)
    }
}
