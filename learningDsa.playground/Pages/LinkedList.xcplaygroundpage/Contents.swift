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


head = insertBegin(head, 40)
head = insertBegin(head, 30)
head = insertBegin(head, 20)
head = insertBegin(head, 20)
head = insertBegin(head, 10)

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

//let insEnd = insertEnd(100, head)
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

//let sval = search(head, 300)
//print(sval)
//printList(head: head)


func sortedInsert(_ head : LinkedList? , _ key : Int) -> LinkedList?{
    var temp = LinkedList(key)
    guard let head = head else {
        return nil
    }
    
    if(head.data > key){
        temp.next = head
        return temp
    }
    
    var curr = head
    while (curr.next != nil && curr.next!.data < key) {
        curr = curr.next!
    }
    
    temp.next = curr.next
    curr.next = temp
    return head
    
}

let sortedINsert = sortedInsert(head, 15)

//printList(head: sortedINsert)


// Mark: - Middle of LL

func middleOfLinkedList(_ head : LinkedList?){
    if head == nil {
        return
    }
    
    var slow = head
    var fast = head
    
    while (fast != nil && fast?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next
    }
    print(slow?.data)
}


//middleOfLinkedList(head)

//method 1
func findNthNodeFromEndOfLinkedList(_ head : LinkedList?, _ index : Int){
    var totalLength = 1
    if head == nil {
        return
    }
    var temp = head
    var curr = head
    while curr?.next != nil  {
        curr = curr?.next
        totalLength += 1
    }
    
    for i in 0..<totalLength - index {
//        print(temp?.data)
        temp = temp?.next
    }
    print(temp?.data)
    print(totalLength)
}

//findNthNodeFromEndOfLinkedList(head, 1)

// Mark: - Reverse of Linked list

func reverseOfLinkedList(_ head : LinkedList?){
    var list : [Int] = []
    
    if head == nil {
        return
    }
    var curr = head
    while curr?.next != nil  {
        list.append(curr?.data ?? 0)
        curr = curr?.next
    }
    list.append(curr?.data ?? 0)
//    for number in stride(from: 10, to: 0, by: -2) {

//    for number in stride(from: list.count, through: 0, by: -1){
//        var temp = LinkedList(list[number])
//
//    }
    var newHead : LinkedList?
    for i in 0..<list.count {
      newHead = insertBegin(newHead, list[i])
    }
    
    printList(head: newHead)
    
   
    
    
    print(list)
}

//reverseOfLinkedList(head)


//Method - 2

func recursiveReverse(_ head : LinkedList?) -> LinkedList?{
    if (head == nil || head?.next == nil) {
        return head
    }
    
    var restHead = recursiveReverse(head?.next)
    var restTail = head?.next
    restTail?.next = head
    head?.next = nil
    return restHead
}

//printList(head: recursiveReverse(head))

func recReverse(_ curr : LinkedList? , _ prev : LinkedList?) -> LinkedList?{
    if(curr == nil){
        return prev
    }
    var next = curr?.next
    curr?.next = prev
    return recReverse(next, curr)
}
//var prev : LinkedList?
//printList(head: recReverse(head, prev))

func removeDuplicateFromLinkedList(_ head : LinkedList?) -> LinkedList?{
    if head == nil {
        return head
    }
    
    var curr = head
    while (curr?.next != nil) {
        if(curr?.data == curr?.next?.data){
            break
        }
        curr = curr?.next
    }
    
    curr?.next = curr?.next?.next
    return head
    
}
//printList(head: head)
//printList(head: removeDuplicateFromLinkedList(head))

//Palindrome of linked list

func isPalindrome(_ head : LinkedList?) -> Bool{
    if(head == nil){
        return false
    }
    
    var slow = head; var fast = head
    
    while(fast?.next != nil && fast?.next?.next != nil){
        slow = slow?.next
        fast = fast?.next?.next
    }
    var rev = recursiveReverse(slow?.next)
    var curr = head
    
    while(rev != nil){
        if(rev?.data != curr?.data){
            return false
        }
        rev = rev?.next
        curr = curr?.next
    }
    
    return true
}

print(isPalindrome(head))
