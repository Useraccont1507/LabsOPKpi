//
//  main.swift
//  Lab4 (on Swift)
//
//  Created by Illia Verezei on 13.11.2024.
//

import Foundation

//MARK: - 5

func sum1(_ args: Int...) -> Int {
  var result = 0
  for i in 0..<args.count {
    result += args[i]
  }
  return result
}

func sum2(_ args: Int...) -> Int {
  var result = 0
  for i in args {
    result += args[i]
  }
  return result
}

func sum3(_ args: Int...) -> Int {
  var result = 0
  var i = 0
  while i < args.count {
    result += args[i]
    i += 1
  }
  return result
}

func sum4(_ args: Int...) -> Int {
  var result = 0
  var i = 0
  repeat {
    result += args[i]
    i += 1
  } while i < args.count
  return result
}

func sum5(_ args: Int...) -> Int {
  args.reduce(0, +)
}

let a = sum1(1, 2, 3)
let b = sum2(0)
let c = sum3()
let d = sum4(1, -1, 1)
let e = sum5(10, -1, -1, -1)

print(a)
print(b)
print(c)
print(d)
print(e)

//MARK: - 6

let array = [[1, 56, 234, 23], [3, 5, 1, 67, -100], [1123, 43, -434, 23323323]]

func findMaxManually(_ array: [[Int]]) -> Int {
  var biggestNum = Int.min
  for item in array {
    for element in item {
      if element > biggestNum {
        biggestNum = element
      }
    }
  }
  return biggestNum
}

let biggestNumber = findMaxManually(array)
print(biggestNumber)

//MARK: - 7

let persons: [String: [String: Int]] = [
  "lenin": ["born": 1870, "died": 1924],
  "mao": ["born": 1893, "died": 1976],
  "gandhi": ["born": 1869, "died": 1948],
  "hirohito": ["born": 1901, "died": 1989],
]

func ages(dict: [String: [String: Int]]) -> [String: Int] {
  var dictToReturn: [String: Int] = [:]
  
  for item in dict {
    let name = item.key
    
    let born = item.value["born"] ?? 0
    let died = item.value["died"] ?? 0
  
    let life = died - born
    dictToReturn.updateValue(life, forKey: name)
  }
  
  return dictToReturn
}

let personsAges = ages(dict: persons)

print(personsAges)
