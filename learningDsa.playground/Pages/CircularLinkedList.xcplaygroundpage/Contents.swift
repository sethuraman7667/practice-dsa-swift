import Darwin
class CircularLinkedList  {
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
    if(head == nil){
        return
    }
    var curr = head
    repeat{
        print(curr?.data ?? 0)
        curr = curr?.next
    } while (curr?.data != head?.data)
        
}

printList(head: head)

