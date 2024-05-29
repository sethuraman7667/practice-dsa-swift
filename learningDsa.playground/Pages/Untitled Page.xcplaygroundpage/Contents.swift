// Heap data structure
//

struct MinHeap<T : Comparable> {
     var elements : [T]
    
    mutating func insertOperation(_ value : T){
        elements.append(value)
        siftUp(elements.count - 1)
    }
    
    mutating func deleteOperation() -> T? {
        guard !elements.isEmpty else { return nil}
        
        elements.swapAt(0, count - 1)
        let removed = elements.removeLast()
        siftDown(0)
        return removed
    }
    
    
    
    mutating func siftUp(_ currentIndex : Int) {
        var childIndex = currentIndex
        var parentIndex = parent(childIndex)
        
        while childIndex > 0 && elements[parentIndex] > elements[childIndex] {
            elements.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = parent(childIndex)
        }
    }
    
    
    /// Min heapify
    mutating func siftDown(_ value : Int) {
        let left = leftChildIndex(of: value)
        let right = rightChildIndex(of: value)
        var smallest = value
        
        if(left < count && elements[left] < elements[smallest]) {
            smallest = left
        }
        
        if(right < count && elements[right] < elements[smallest]) {
            smallest = right
        }
        
        if(smallest != value) {
            elements.swapAt(value, smallest)
            siftDown(smallest)
        }
    }
    
    mutating func siftDownMaxHeap(_ value : Int) {
        let left = leftChildIndex(of: value)
        let right = rightChildIndex(of: value)
        var largest = value
        
        if(left < count && elements[left] > elements[largest]) {
            largest = left
        }
        
        if(right < count && elements[right] > elements[largest]) {
            largest = right
        }
        
        if(largest != value) {
            elements.swapAt(value, largest)
            siftDown(largest)
        }
    }
    
    mutating func buildHeap() {
        for i in (count - 1)..<(count - 2) / 2 {
            siftDown(i)
        }
    }
    
    ///Extract Min
    ///
    mutating func extractMin() -> Int {
        var minIndex = count
        if (minIndex == 0) {
            return Int(Double.infinity)
        }
        
        if (minIndex == 1) {
            return elements.first as! Int
        }
        
        elements.swapAt(0, count - 1)
        minIndex -= 1
        siftDown(0)
        return elements[minIndex] as! Int
    }
    
    
    
    
    /// Decrease key
    mutating func decreaseKey(_ index : Int, _ x : T) {
        elements[index] = x
        siftUp(index)
        
    }
    
    func parent(_ num : Int) -> Int {
        let numb = num - 1
        return numb / 2
    }
    
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    func peek() -> T? {
        return elements.first
    }
    
    func poll() -> T? {
        return elements.last
    }
    
}

var hp = MinHeap(elements: [10,20,15,40,50,100,25,45])
print(hp.elements)
hp.insertOperation(12)

print(hp.elements)


//Heap sort

//func heapSort(_ arr : [Int], _ n : Int) {
//    buildHeap(arr, n)
//    for i in (n - 1 ..< 0).reversed() {
//        swap(arr[0], i)
//        maxheapify(arr, i, 0)
//    }
//
//}

func sortkSortedArray(_ arr : inout [Int], _ k : Int) -> [Int] {
    var minHeap = MinHeap<Int>(elements: [])
    var sortedArray : [Int] = []
    
    
    for i in 0..<k {
        minHeap.insertOperation(arr[i])
    }
    var index = 0
    
    for j in (k + 1 ..< arr.count - 1) {
        /// Extract min element of array
        index += 1
        let minElementIndex = index

        ///replace current element in the array
        arr[minElementIndex] = minHeap.deleteOperation()!
        minHeap.insertOperation(arr[j])
        
        while (minHeap.isEmpty == false) {
            index += 1
            let minElementIndex = index
            arr[minElementIndex] = minHeap.deleteOperation()!
        }
    }
    return arr
    
}

var sk = [9,8,7,19,18]
print(sortkSortedArray( &sk, 2))
