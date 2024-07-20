/*:
 # Queue
 * **Protocol**
*/
public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element : Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty : Bool { get }
    var peek : Element? { get }
}

// Array based implementation

public struct QueueArray<T>: Queue {
    private var array : [T] = []
    public init() {}
    
    public var isEmpty : Bool {
      return  array.isEmpty
    }
    
    public var peek :  T? {
        return array.first
    }
    
    public mutating func enqueue(_ element : T) -> Bool{
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }

}

extension QueueArray : CustomStringConvertible {
    public var description : String {
        return array.description
    }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue.dequeue()

/* :
* Removing an item from the front of the queue can be inefficient, as removal causes all elements to shift up by one.
* This makes a difference for very large queues.
* Once the array gets full, it has to resize and may have unused space.
* This could increase your memory footprint over time.
   */


// Ring Buffer

extension Array {
    subscript (wrapped index : Int) -> Element {
        get {
            return self[index % count]
        }
        set {
            self[index % count] = newValue
        }
    }
}

