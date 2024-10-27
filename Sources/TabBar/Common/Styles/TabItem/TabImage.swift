//
//  TabImage.swift
//  TabBar
//
//  Created by Oskari Rauta on 27.10.2024.
//

import SwiftUI

public struct TabImage: ExpressibleByStringLiteral, ExpressibleByDictionaryLiteral {
        
    public enum ImageType {
        case image, selected
    }
    
    public typealias Key = TabImage.ImageType
    public typealias Value = Any
    public typealias StringLiteralType = String
    
    public var image: Image
    public var selected: Image
    
    public init(dictionaryLiteral elements: (ImageType, Value)...) {
        
        let dict = [TabImage.ImageType: Any](uniqueKeysWithValues: elements)
        
        if let value = dict[TabImage.ImageType.image], let img = value as? Image {
            self.image = img
        } else if let value = dict[TabImage.ImageType.image], let img = value as? String {
            self.image = Image(systemName: img)
        } else {
            self.image = Image(systemName: "x.square")
        }

        if let value = dict[TabImage.ImageType.selected], let img = value as? Image {
            self.selected = img
        } else if let value = dict[TabImage.ImageType.selected], let img = value as? String {
            self.selected = Image(systemName: img)
        } else {
            self.selected = self.image
        }

    }

    public init(stringLiteral value: String) {
        self.image = Image(systemName: value)
        self.selected = Image(systemName: value)
    }

    public init(_ image: Image) {
        self.image = image
        self.selected = image
    }

    public init(_ systemName: String) {
        self.image = Image(systemName: systemName)
        self.selected = Image(systemName: systemName)
    }

    public init(systemName: String) {
        self.image = Image(systemName: systemName)
        self.selected = Image(systemName: systemName)
    }

    public init(image: Image, selected: Image) {
        self.image = image
        self.selected = selected
    }

    public init(image: Image, selected: String) {
        self.image = image
        self.selected = Image(systemName: selected)
    }

    public init(_ image: String, selected: Image) {
        self.image = Image(systemName: image)
        self.selected = selected
    }

    public init(_ image: Image, selected: String) {
        self.image = image
        self.selected = Image(systemName: selected)
    }

    public init(_ image: String, selected: String) {
        self.image = Image(systemName: image)
        self.selected = Image(systemName: selected)
    }

}
