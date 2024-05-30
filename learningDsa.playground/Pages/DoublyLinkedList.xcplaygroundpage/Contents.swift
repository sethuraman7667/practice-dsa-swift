class DoublyLinkedList{
    var prev : DoublyLinkedList?
    var data : Int
    var next : DoublyLinkedList?
    init( _ data : Int, _ prev : DoublyLinkedList? = nil, _ next : DoublyLinkedList? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

// Helper function to print the linked list
func printList(head: DoublyLinkedList?) {
    var current = head
    while current != nil {
        print("\(current!.data) ", terminator: "")
        current = current?.next
    }
    print()
}

var head : DoublyLinkedList? = nil


///Mark: -Insert Begin

func insertBegin(_ data : Int, _ head : DoublyLinkedList?) -> DoublyLinkedList?{
    var temp = DoublyLinkedList(data)
    temp.next = head
    head?.prev = temp
    return temp
    
}

 head = insertBegin(10, head)
 head = insertBegin(20, head)
 head = insertBegin(30, head)


func reverseDLL( _ head : DoublyLinkedList?) -> DoublyLinkedList?{
    if(head == nil || head?.next == nil){
        return head
    }
    var curr = head
    var prev : DoublyLinkedList? = nil
    while(curr != nil){
        prev = curr?.prev
        curr?.prev = curr?.next
        curr?.next = prev
        curr = curr?.prev
    }
    return prev?.prev
}

head = reverseDLL(head)

printList(head: head)



