//
//  main.swift
//  test1
//
//  Created by Illia Verezei on 13.11.2024.
//

import Foundation

print("Functions")

//MARK: - 1
func random(min: Double = 0, max: Double) -> Int {
  Int(Double.random(in: min...max))
}

print(random(max: 30))

//MARK: - 2
let characters = "fsjkdfnmkjwnekjfnkjwenfkjwenfkjwenfkjnsdmdsfdsf"

func generateKey(characters: String, lenght: Int) -> String {
  var key = ""
  
  for _ in 0..<lenght {
    key.append(characters.randomElement()!)
  }
  return key
}

print((generateKey(characters: characters, lenght: 10)))

//MARK: - 3

func ipToNumber(ip: String = "127.0.0.1") -> Int {
  let bytes = ip.split(separator: ".").map { Int($0)! }
  
  return bytes.enumerated().reduce(0) { (result, element) in
    let (index, byte) = element
    return result + (byte << (8 * (3 - index)))
  }
}

print(ipToNumber(ip: "127.0.0.1"))
print(ipToNumber(ip: "10.0.0.1"))
print(ipToNumber(ip: "192.168.1.10"))
print(ipToNumber(ip: "165.225.133.150"))
print(ipToNumber(ip: "0.0.0.0"))
print(ipToNumber(ip: "8.8.8.8"))

//MARK: - 4

class MyClass {
  var m1: (Int) -> [Int] = { x in return [x] }
  var m2: (Int, Int) -> [Int] = { x, y in return [x, y] }
  var m3: (Int, Int, Int) -> [Int] = { x, y, z in return [x, y, z] }
}

func introspectFunctions(of object: Any) -> [[Any]] {
  var result: [[Any]] = []
  let mirror = Mirror(reflecting: object)
  
  for child in mirror.children {
    guard let label = child.label else { continue }
    
    if let function = child.value as? AnyObject {
      let functionType: any AnyObject.Type = type(of: function)
      
      if let functionSignature = functionType as? AnyObject {
        let numberOfArguments = getNumberOfArguments(for: functionSignature)
        result.append([label, numberOfArguments])
      }
    }
  }
  
  return result
}

func getNumberOfArguments(for function: AnyObject) -> Int {
  if function is ((Int) -> [Int]) {
    return 1
  } else if function is ((Int, Int) -> [Int]) {
    return 2
  } else if function is ((Int, Int, Int) -> [Int]) {
    return 3
  }
  return 0
}

let myObject = MyClass()
let introspectionResult = introspectFunctions(of: myObject)

for item in introspectionResult {
  print(item)
}
