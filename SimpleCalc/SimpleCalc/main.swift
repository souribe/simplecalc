//
//  main.swift
//  SimpleCalc
//
//  Created by Benny Souyadeth on 1/12/18.
//  Copyright © 2017 Benny Souriyadeth. All rights reserved.
//

import Foundation

/* There are two methods in here, one that takes an array of Strings as input, and one that takes a single String. The single String calculate takes the String and splits it into multiple Strings and passes that to the array-of-Strings version of calculate, so the bulk of your work will be in there. */

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        
        var count : Int = 0
        var input : [String] = args
        for _ in input {
            count += 1
        }
        if count == 3 {
            let input1 : Int = Int(input[0])!
            let input2 : Int = Int(input[2])!
            switch input[1] {
            case "+":
                return (input1 + input2)
            case "-":
                return (input1 - input2)
            case "*":
                return (input1 * input2)
            case "/":
                return (input1 / input2)
            case "%":
                if (input1 > 0 && input2 < 0) || (input1 < 0 && input2 < 0) { //neg test case
                    return  -1 * (input1 % input2)
                } else {
                    return (input1 % input2)
                }
            default:
                print("Did not input correct operation")
                return 0
            }
        } else {
            count = count - 1
            if count == 0 { // if no input, return 0
                return 0
            }
            switch input[count] {
            case "count":
                return count
            case "avg":
                input.removeLast()
                var total = 0
                for num in input {
                    total += Int(num)!
                }
                return total / count
            case "fact":
                var number : Int = Int(input[0])!
                var total = 1
    
                if number == 0 || number == 1 { // "0", "1" "fact"
                    return 1
                }
                if (number < 0) {   //test for neg ops
                    while number != 0 {
                        total *= number
                        number += 1
                    }
                } else {
                    while number != 0 {
                        total *= number
                        number -= 1
                    }
                }
                return total
            default:
                print("Not a proper expression")
                return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

