//: [Previous](@previous)

import Foundation


precedencegroup PowerPrecedence { higherThan : MultiplicationPrecedence }

infix operator ** : PowerPrecedence

func ** (radix : Int, power : Int) -> Int{
    return Int(pow(Double(radix), Double(power)))
}

func ** (radix : Double, power : Int) -> Double{
    return Double(pow(radix, Double(power)))
}

extension Character {
    var asInt : Int {
        let s = String(self).unicodeScalars
        return Int(s[s.startIndex].value)
    }
}

func search(_ text : String,_ pattern : String) -> Int{

    let patternArray = pattern.compactMap { $0.asInt }
    let textArray = text.compactMap { $0.asInt}
    let patternSum = patternArray.reduce(0 , +)
    
    
    if textArray.count < patternArray.count {
        return -1
    }
    
    func additionForPatternLength(_ num : [Int]) -> Int {
        var sum = 0
        return num.reduce(0, +)
    }
    
    
    for index in 0...(textArray.count - patternArray.count){
        
        let eIds = index + (patternArray.count - 1)
        let textSum = additionForPatternLength(Array(textArray[index...eIds]))
       
        if(textSum == patternSum){
            return index
        } else {
//            return -1
        }
        
    }
    return 0
}

assert(search("The big dog jumped over the fox", "ump") == 13, "print correct number")



