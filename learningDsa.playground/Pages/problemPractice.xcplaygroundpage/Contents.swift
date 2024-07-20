import Foundation
enum ArithematicExpression {
    case number(Int)
    indirect case addition(ArithematicExpression, ArithematicExpression)
    indirect case multiply(ArithematicExpression, ArithematicExpression)
}

let five = ArithematicExpression.number(5)
let four = ArithematicExpression.number(4)
let sum = ArithematicExpression.addition(five, four)
print(sum)

let product = ArithematicExpression.multiply(sum, ArithematicExpression.number(2))




