//: Playground - noun: a place where people can play

import Foundation

struct Book {

    public var id: Int
    public var name: String

    init(id: Int, name: String = "unnamed") {
        self.id = id
        self.name = name
    }
}

// 实现CustomStringConvertible协议，提供description方法
extension Book: CustomStringConvertible {
    public var description: String {
        return "id:\(id)\nname:《\(name)》"
    }
}

// 实现ExpressibleByDictionaryLiteral字面量协议
extension Book: ExpressibleByDictionaryLiteral {
    typealias Key = String
    typealias Value = Any

    public init(dictionaryLiteral elements: (Key, Value)...) {
        var dictionary = [Key: Value](minimumCapacity: elements.count)
        for (k, v) in elements {
            dictionary[k] = v
        }

        let id = (dictionary["id"] as? Int) ?? 0
        let name = (dictionary["name"] as? String) ?? "unnamed"

        self.init(id: id, name: name)
    }
}

// 实现ExpressibleByArrayLiteral字面量协议
extension Book: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Any

    public init(arrayLiteral elements: ArrayLiteralElement...) {
        var id: Int = 0
        if let eId = elements.first as? Int {
            id = eId
        }

        var name = "unnamed"
        if let eName = elements[1] as? String {
            name = eName
        }

        self.init(id: id, name: name)
    }
}

// 实现ExpressibleByNilLiteral字面量协议
extension Book: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self.init()
    }
}

// 通过字典字面量初始化
let dictBook: Book = ["id": 100, "name": "Love is Magic"]
print("\(dictBook)\n")

// 通过数组字面量初始化
let arrayBook: Book = [101, "World is word"]
print("\(arrayBook)\n")

// 通过nil字面量初始化
let nilBook: Book = nil
print("\(nilBook)\n")
