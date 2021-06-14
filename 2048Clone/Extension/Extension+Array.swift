//
//  Extension+Array.swift
//  2048Clone
//
//  Created by Huong Nguyen on 10/06/2021.
//

import Foundation

extension Array {
    var size: Int { return Int(sqrt(Double(count)))}
    
    subscript(x: Int, y: Int) -> Element {
        get {return self[(y * size) + x]}
        set {self[(y * size) + x] = newValue}
    }

    func coord(at index: Int) -> (x: Int, y: Int) {
        return (x: index % size, y: Int(index / size))
    }

    func randomElement() -> Element? {
        return self.count > 0 ? self[Int(arc4random_uniform(UInt32(self.count)))] : nil
    }
}

extension Array where Element: Equatable {
    func indecies(of value: Element) -> [(x: Int, y: Int)] {
        return self.enumerated().compactMap {
            $0.element == value ? coord(at: $0.offset) : nil
        }
    }
    
    // 2048 matrix
    var moceIsPossible: Bool {
        get {
            for y in 0 ..< size {
                for x in 0 ..< size {
                    if (y > 0 && self[x, y - 1] == self[x, y]) || (x > 0 && self[x - 1, y] == self[x, y]) || (y < size - 1 && self[x, y + 1] == self[x, y]) || (x < size - 1 && self[x + 1, y] == self [x, y]) {
                        return true
                    }
                }
            }
            return false
        }
    }
}
