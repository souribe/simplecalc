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
        print(args)
        var count : Int = 0
        let input : [String] = args
        for _ in input {
            count += 1
        }
        if count == 3 {
            let input1 : Int = Int(input[0])!
            let input2: Int = Int(input[2])!
            switch input[1] {
                case "+":
                    return (input1 + input2)
                case "-":
                    return (input1 - input2)
                case "*":
                    return (input1 * input2)
                case "/":
                    return (input1 / input2)
                default:
                    return (input1 % input2)
            }
        } else {
            count = count - 1
            switch input[count] {
            case "count":
                return count
            case "avg":
//                let total : Int = 0
//                for num in input {
//                    total +=
//                }
                return 2
            case "fact":
                return 3
            default:
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

