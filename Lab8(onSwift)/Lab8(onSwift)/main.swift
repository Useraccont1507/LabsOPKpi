//
//  main.swift
//  Lab10(onSwift)
//
//  Created by Illia Verezei on 25.11.2024.
//

import Foundation

//MARK: 1
let obj: [String: Int] = [
  "a": 1,
  "b": 2,
  "c": 3
]

func iterate(obj: [String: Int], competion: (String, Int) -> ()) {
  for (key, value) in obj {
    competion(key, value)
  }
}

iterate(obj: obj) { key, value in
  print("Key: \(key), value: \(value), object: \(obj)")
}

//Output:

/*
 Key: c, value: 3, object: ["c": 3, "a": 1, "b": 2]
 Key: a, value: 1, object: ["c": 3, "a": 1, "b": 2]
 Key: b, value: 2, object: ["c": 3, "a": 1, "b": 2]
 */

//MARK: 2

func store<T>(_ value: T) -> () -> T {
  return { value }
}

let read = store(5)
let value = read()
print(value)

// Output: 5

//MARK: 3
enum ContractError: Error {
  case typeMismatch(expected: String, actual: String)
}

func contract<T, U, R>(
  _ fn: @escaping (T, U) -> R,
  _ arg1Type: T.Type,
  _ arg2Type: U.Type,
  _ returnType: R.Type
) -> (T, U) throws -> R {
  return { arg1, arg2 in
    // Validate argument types
    guard type(of: arg1) == arg1Type else {
      throw ContractError.typeMismatch(expected: "\(arg1Type)", actual: "\(type(of: arg1))")
    }
    guard type(of: arg2) == arg2Type else {
      throw ContractError.typeMismatch(expected: "\(arg2Type)", actual: "\(type(of: arg2))")
    }
    
    // Execute function and validate return type
    let result = fn(arg1, arg2)
    guard type(of: result) == returnType else {
      throw ContractError.typeMismatch(expected: "\(returnType)", actual: "\(type(of: result))")
    }
    
    return result
  }
}

let add: (Int, Int) -> Int = { a, b in a + b }

do {
    let addNumbers = try contract(add, Int.self, Int.self, Int.self)
    let result = try addNumbers(2, 3)
    print(result) // Output: 5
} catch {
    print("Error: \(error)")
}
let concat: (String, String) -> String = { s1, s2 in s1 + s2 }

do {
    let concatStrings = try contract(concat, String.self, String.self, String.self)
    // Correct types are passed here:
    let result = try concatStrings("Hello ", "world!")
    print(result) // Output: Hello world!
} catch {
    print("Error: \(error)")
}
