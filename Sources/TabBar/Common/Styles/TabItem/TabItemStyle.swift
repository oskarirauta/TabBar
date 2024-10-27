//
//  MIT License
//
//  Copyright (c) 2021 Tamerlan Satualdypov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

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

/**
 A type that represents tab item style.
 
 This type is used by `TabBar` to apply custom styles to its items.
 You can easily pass your custom item style to `TabBar` by
 using `tabItem(style:)` function.
 */
public protocol TabItemStyle {
    associatedtype Content: View

    func tabItem(image: TabImage, title: String, isSelected: Bool) -> Content
}

extension TabItemStyle {
    
    public func tabItem(image: TabImage, title: String, isSelected: Bool) -> Content {
        return self.tabItem(image: image, title: title, isSelected: isSelected)
    }
    
    func tabItemErased(image: TabImage, title: String, isSelected: Bool) -> AnyView {
        return .init(self.tabItem(image: image, title: title, isSelected: isSelected))
    }
}
