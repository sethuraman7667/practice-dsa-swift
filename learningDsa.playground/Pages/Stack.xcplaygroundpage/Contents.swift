/*
 # Stack
 */

struct Stack {
    fileprivate var array : [String] = []
    
    mutating func push(_ element : String){
        array.append(element)
    }
    
    mutating func pop(){
        array.isEmpty ? nil : array.popLast()
    }
    
    mutating func peek() -> String? {
        return array.last
    }
    
}



// 1
extension Stack: CustomStringConvertible {
  // 2
  var description: String {
    // 3
    let topDivider = "---Stack---\n"
    let bottomDivider = "\n-----------\n"

    // 4
    let stackElements = array.reversed().joined(separator: "\n")
    // 5
    return topDivider + stackElements + bottomDivider
  }
}


var rwBookStack = Stack()
rwBookStack.push("3D Games by Tutorials")
rwBookStack.push("tvOS Apprentice")
rwBookStack.push("iOS Apprentice")
rwBookStack.push("Swift Apprentice")
print(rwBookStack)
