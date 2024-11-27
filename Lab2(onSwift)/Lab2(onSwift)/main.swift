//
//  main.swift
//  Lab2(onSwift)
//
//  Created by Illia Verezei on 27.11.2024.
//

import Foundation

//MARK: Collections

let data: [[String: String]] = [
  ["name": "Marcus Aurelius", "phone": "+380445554433"],
  ["name": "Simon Petliura", "phone": "+380569801488"],
  ["name": "Patrick Bateman", "phone": "+380966965692"]
]

func findPhoneByName(_ name: String) -> String {
  var valueToReturn: String?
  for dict in data {
    if name == dict["name"] {
      valueToReturn = dict["phone"]
    }
  }
  return valueToReturn ?? "no value for such name"
}

print(findPhoneByName("Simon Petliura")) //Output: +380569801488

let hash = [
  "Marcus Aurelius": "+380445554433",
  "Simon Petliura": "+380569801488",
  "Patrick Bateman": "+380966965692"
]

func findByName1(_ name: String) -> String {
  hash[name] ?? "no value for such name"
}

print(findByName1("Patrick Bateman")) //Output: +380966965692

//MARK: Cycles

func range(start: Int = 15, end: Int = 30) -> [Int] {
  var wholeNums = [Int]()
  var num = start
  while num <= end {
    wholeNums.append(num)
    num += 1
  }
  return wholeNums
}

print(range()) //Output: [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

func rangeOdd(start: Int = 15, end: Int = 30) -> [Int] {
  var oddNums = [Int]()
  var num = start
  while num <= end {
    if num % 2 == 0 {
      num += 1
      continue
    }
    oddNums.append(num)
    num += 1
  }
  return oddNums
}

print(rangeOdd()) //Output: [15, 17, 19, 21, 23, 25, 27, 29]

//MARK: Functions

func average(_ a: Int, _ b: Int) -> Int { (a + b) / 2 }
func square(_ a: Int) -> Int { a * a }
func cube(_ a: Int) -> Int { a * a * a }

func calculate() -> [Int] {
  var array = [Int]()
  var i = 0
  while i <= 9 {
    let a = square(i)
    let b = cube(i)
    let result = average(a, b)
    array.append(result)
    i += 1
  }
  return array
}

print(calculate()) //Output: [0, 1, 6, 18, 40, 75, 126, 196, 288, 405]

//MARK: Identifiers

/*
 let myName = 'mike'
 const myAge = 17

 function greeting(name) {
     console.log()`welcome,${name}!`
 }
 greeting(myName)
 */

var myName = "Illia"
let myAge = 17

func greeting(_ name: String) {
  print("Welcome, \(name)")
}

greeting("Illia") //Output: Welcome, Illia

//MARK: Objects
/*
 function fn() {
     const obj1 = { name: 'mike' }
     let obj2 = { name: 'mike' }
     console.log(obj1, obj2)

     //obj1 = {name:'vitalik'}
     obj2 = { name: 'vitalik' }
     console.log(obj1, obj2)

     obj1.name = 'anton'
     obj2.name = 'anton'
     console.log(obj1, obj2)
 }
 fn()
 /* Пояснення роботи коду:
  Спочатку я записав 2 об'єкти,як і написано в завданні

  В наступному сегменті змінити obj1 не вийшло,
  адже це константа,на відміну від obj2

  В третьому сегменті я продемонстував,що ,посилаючись безпосередньо на ключі об'єктів,
  їх можна змінити в обох obj */


 function createUser(name, city) {
     const obj = { name, city }
     return obj
 }
 console.dir('\n', createUser('mike', 'kyiv'))
 */

func fn() {
  let obj1 = ["name": "Illia"]
  var obj2 = ["name": "Illia"]
  
  //obj1 = ["name": "Andy"] Imposible due to let declaretion
  obj2 = ["name": "Andy"]
  print(obj1)
  print(obj2)
  
  //obj1["name"] = "Andy" In swift I can't change value in obj1 with let declaretion via key like in JS
  obj2["name"] = "Andy"
  print(obj2["name"])
}

func createUser(name: String, city: String) -> [String: String] {
  let obj = [name: city]
  return obj
}

print(createUser(name: "Illia", city: "Kyiv")) //Output: ["Illia": "Kyiv"]
