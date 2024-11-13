//
//  main.swift
//  Lab7 (on Swift)
//
//  Created by Illia Verezei on 13.11.2024.
//

import Foundation


//MARK: - 1

var arrayInt = [1, 2, 3, 4, 5, 6, 7]
var arrayString = ["Kiyv", "Beijing", "Lima", "Saratov"]


func removeElement<T: Equatable>(_ array: inout [T], element: T) {
  array = array.filter { item in
    !(element == item)
  }
}

removeElement(&arrayInt, element: 5)

print(arrayInt)

removeElement(&arrayString, element: "Lima")
removeElement(&arrayString, element: "Berlin")

print(arrayString)

//MARK: - 2

var arrayInt2 = [1, 2, 3, 4, 5, 6, 7]
var arrayString2 = ["Kiyv", "Beijing", "Lima", "Saratov"]


func removeElementImproved<T: Equatable>(_ array: inout [T], elements: T...) {
  array = array.filter { item in
    !elements.contains(item)
  }
}

removeElementImproved(&arrayInt, elements: 5, 1, 6)

print(arrayInt)

removeElementImproved(&arrayString, elements: "Lima", "Berlin", "Kiyv")

print(arrayString)

//MARK: - 3

func unique<T: Hashable>(_ array: [T]) -> [T] {
  return Array<T>(Set<T>(array))
}

var array = [2, 1, 1, 3, 2]

let result = unique([2, 1, 1, 3, 2])
let result2 = unique(["top", "bottom", "top", "left"])

print(result)
print(result2)

//MARK: - 4

func difference<T: Equatable>(array1: [T], array2: [T]) -> [T] {
    return array1.filter { !array2.contains($0) }
}

let array1 = [7, -2, 10, 5, 0]
let array2 = [0, 10]
let resultOf = difference(array1: array1, array2: array2)
print(result)

let array1b = ["Beijing", "Kiyv"]
let array2b = ["Kiyv", "London", "Baghdad"]
let resultOf2 = difference(array1: array1b, array2: array2b)
print(resultOf2)
