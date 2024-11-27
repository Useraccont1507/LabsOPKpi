//
//  main.swift
//  Lab6(onSwift)
//
//  Created by Illia Verezei on 27.11.2024.
//

import Foundation

class FunctionComposer<T> {
    private var errorHandlers: [(Error) -> Void] = []
    private let functions: [(T) throws -> T]
    
    init(_ functions: [(T) throws -> T]) {
        self.functions = functions
    }
    
    func callAsFunction(_ input: T) -> T? {
        var result: T? = input
        for function in functions.reversed() {
            do {
                if let value = result {
                    result = try function(value)
                }
            } catch {
                result = nil
                errorHandlers.forEach { $0(error) }
                break
            }
        }
        return result
    }
    
    func onError(_ handler: @escaping (Error) -> Void) {
        errorHandlers.append(handler)
    }
}

// Example
let inc: (Int) throws -> Int = { $0 + 1 }
let twice: (Int) throws -> Int = { $0 * 2 }
let cube: (Int) throws -> Int = { $0 * $0 * $0 }

// Error
let fail: (Int) throws -> Int = { _ in throw NSError(domain: "Error", code: 1, userInfo: nil) }

let composer = FunctionComposer([inc, twice, cube])
composer.onError { error in
    print("Error:", error)
}

if let result = composer(5) {
    print(result) // 1728
} else {
    print("Error occured")
}

// Error example
let composerWithFailure = FunctionComposer([inc, fail, cube])
composerWithFailure.onError { error in
    print("Error:", error)
}

if let result = composerWithFailure(5) {
    print(result)
} else {
    print("Error occured") // Error: ...
}
