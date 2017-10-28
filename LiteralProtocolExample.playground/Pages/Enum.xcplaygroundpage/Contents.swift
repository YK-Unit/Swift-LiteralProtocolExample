//: Playground - noun: a place where people can play

import Foundation

struct StockType {
    var number: Int
}

// 实现CustomStringConvertible协议，提供description方法
extension StockType: CustomStringConvertible {
    public var description: String {
        return "Stock Number:\(number)"
    }
}

// 实现Equatable协议，提供==方法
extension StockType: Equatable {
    public static func ==(lhs: StockType, rhs: StockType) -> Bool {
        return lhs.number == rhs.number
    }
}

// 实现ExpressibleByDictionaryLiteral字面量协议
extension StockType: ExpressibleByDictionaryLiteral {
    typealias Key = String
    typealias Value = Any

    public init(dictionaryLiteral elements: (Key, Value)...) {
        var dictionary = [Key: Value](minimumCapacity: elements.count)
        for (k, v) in elements {
            dictionary[k] = v
        }

        let number = (dictionary["number"] as? Int) ?? 0

        self.init(number: number)
    }
}

// 实现ExpressibleByIntegerLiteral字面量协议
extension StockType: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(number: value)
    }
}

/*
 若StockType没有实现 ExpressibleByIntegerLiteral、ExpressibleByFloatLiteral、ExpressibleByStringLiteral中的一个，会报错误：error: raw type 'StockType' is not expressible by any literal
 */
// 你可以尝试去掉ExpressibleByIntegerLiteral的实现，看看编译器报的错误
enum Stock: StockType {
    case apple = 1001
    case google = 1002
}

let appleStock = Stock.apple.rawValue
print("\(appleStock)")
