// Hash Table

class MyHash{
    var bucket : Int
    var table : [Int]
    init (_ b : Int){
        bucket = b
        table = Array<Int>(repeating : 0, count : b)
    }
    
//    func insert(_ key : Int){
//        var k : Int = key % bucket
//        table[k].append(key)
//    }
//
//    func remove(_ key : Int) {
//        var k = key % bucket
//        table[k].remove(at: k)
//    }
//
//    func search(_ key : Int){
//        var k = key % bucket
//        return table[k].contains(key)
//    }
    
    
}


