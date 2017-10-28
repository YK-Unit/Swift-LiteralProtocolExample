//: Playground - noun: a place where people can play

import UIKit
import Foundation

struct Money {
    var value: Double

    init(value: Double) {
        self.value = value
    }
}

// 实现CustomStringConvertible协议，提供description方法
extension Money: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

// 实现ExpressibleByIntegerLiteral字面量协议
extension Money: ExpressibleByIntegerLiteral {
    typealias IntegerLiteralType = Int

    public init(integerLiteral value: IntegerLiteralType) {
        self.init(value: Double(value))
    }
}

// 实现ExpressibleByFloatLiteral字面量协议
extension Money: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value: value)
    }
}

// 实现ExpressibleByStringLiteral字面量协议
extension Money: ExpressibleByStringLiteral {

    public init(stringLiteral value: StringLiteralType) {
        if let doubleValue = Double(value) {
            self.init(value: doubleValue)
        } else {
            self.init(value: 0)
        }
    }

    // 实现ExpressibleByExtendedGraphemeClusterLiteral字面量协议
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        if let doubleValue = Double(value) {
            self.init(value: doubleValue)
        } else {
            self.init(value: 0)
        }
    }

    // 实现ExpressibleByUnicodeScalarLiteral字面量协议
    public init(unicodeScalarLiteral value: StringLiteralType) {
        if let doubleValue = Double(value) {
            self.init(value: doubleValue)
        } else {
            self.init(value: 0)
        }
    }
}

// 实现ExpressibleByBooleanLiteral字面量协议
extension Money: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        let doubleValue: Double = value ? 1.0 : 0.0
        self.init(value: doubleValue)
    }
}


// 通过整数字面量初始化
let intMoney: Money = 10

// 通过浮点数字面量初始化
let floatMoney: Money = 10.1

// 通过字符串字面量初始化
let strMoney: Money = "10.2"

// 通过布尔值初始化
let boolMoney: Money = true



