import Darwin
class CircularLinkedList : Equatable  {
    static func == (lhs: CircularLinkedList, rhs: CircularLinkedList) -> Bool {
        lhs.data == rhs.data &&
        lhs.next == rhs.next
        
    }
    
    var data : Int
    var next : CircularLinkedList?
    init( _ data : Int, _ next : CircularLinkedList? = nil) {
        self.data = data
        self.next = next
    }
}




func insertBegin(_ head : CircularLinkedList?, _ x : Int) -> CircularLinkedList{
    let temp = CircularLinkedList(x)
    temp.next = head
    return temp
}

var head : CircularLinkedList?

head = insertBegin(head, 10)
head = insertBegin(head, 20)


// Helper function to print the linked list
func printList(head: CircularLinkedList?) {
    guard let head = head else {
        return
    }
    var curr : CircularLinkedList? = head
    repeat{
        print(curr!.data)
        curr = curr?.next
    } while (curr != head)
        
}

//printList(head: head)

func insertBeginLinkedList(_ head : CircularLinkedList?, _ data : Int) {
    var temp = CircularLinkedList(data)
    guard let head = head else {
        return
    }
    
    var curr = head
    temp.next = curr.next
    curr.next = temp
    swap(&curr.data, &temp.data)
    
}


head = insertBegin(head, 50)
