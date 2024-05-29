// Mark: - Linked List

class LinkedList {
    var data : Int
    var next : LinkedList?
    init(_ d : Int, _ next : LinkedList? = nil){
        self.data = d
        self.next = next
    }
}
// Mark: -insertBegin


// Helper function to print the linked list
func printList(head: LinkedList?) {
    var current = head
    while current != nil {
        print("\(current!.data) ", terminator: "")
        current = current?.next
    }
    print()
}


func insertBegin(_ head : LinkedList?, _ x : Int) -> LinkedList{
    let temp = LinkedList(x)
    temp.next = head
    return temp
}

var head : LinkedList? = nil

head = insertBegin(head, 10)
head = insertBegin(head, 20)
head = insertBegin(head, 30)
head = insertBegin(head, 40)



func insertGivenPosition(_ data : Int, _ head : LinkedList?, _ pos : Int) -> LinkedList? {
    var temp = LinkedList(data)
    if(pos == 0){
        temp.next = head
        return temp
    }
    
    var curr = head
    var crrPosn = 0
    
    while curr != nil && crrPosn < pos - 1{
        curr = curr?.next
        crrPosn += 1
    }
   
    if curr == nil {
        return head
    }
    
    temp.next = curr?.next
    curr?.next = temp
    return head
}


//let val = insertGivenPosition(50, head, 2)


func insertEnd(_ data : Int, _ head : LinkedList?) -> LinkedList?{
    var temp = LinkedList(data)
    if(head == nil){
        return temp
    }
    
    var curr = head
    while curr?.next != nil {
        curr = curr?.next
    }
    
    curr?.next = temp
    return head
    
}

let insEnd = insertEnd(100, head)
//head = insEnd

func deleteHead(_ head : LinkedList?) -> LinkedList?{
    if(head == nil){
        return nil
    }
    return head?.next
}


//let delH = deleteHead(head)


func deleteTail(_ head : LinkedList?) -> LinkedList?{
    if(head == nil || head?.next == nil){
        return nil
    }
    var curr = head
    while curr?.next?.next != nil {
        curr = curr?.next
    }
    curr?.next = nil
    return head
}

//let delT = deleteTail(head)

func search(_ head : LinkedList?, _ data : Int) -> Int {
    if(head == nil){
        return -1
    }
    if head?.data == data {
        return 1
    }
    
    var searchVal = search(head?.next, data)
    if searchVal == -1 {
        return -1
    } else{
        return searchVal + 1
    }
}

let sval = search(head, 300)
print(sval)
printList(head: head)



