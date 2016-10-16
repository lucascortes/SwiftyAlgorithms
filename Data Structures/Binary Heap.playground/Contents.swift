import Foundation


public class BinaryHeap<Element: Comparable> {

    var array =  [Element]()

    //MARK: - Initialization

    public init() { }

    public init(array: [Element]) {
        self.array = array

        for i in stride(from: Int(array.count/2), to: -1, by: -1) { sink(i) }
    }

    //MARK: - Public interface

    public var isEmpty: Bool { return array.count == 0 }

    public func insert(element: Element) {
        array.append(element)
        swim(array.count - 1)
    }

    public func deleteMax() -> Element {
        let max = array[0]
        array[0] = array[array.count - 1]
        array.removeLast()
        sink(0)
        return max
    }

    public func sort() -> [Element] {
        var sortedArray = array
        for i in 0..<sortedArray.count { sortedArray[i] = deleteMax() }
        return sortedArray
    }

    //MARK: - Private methods

    private func indexParent(_ i: Int) -> Int {
        return Int((i-1)/2)
    }

    private func indexChildren(_ i: Int) -> (Int, Int) {
        return (i*2+1,i*2+2)
    }

    private func swim(_ i: Int) {
        var nodeIndex = i
        while nodeIndex != indexParent(nodeIndex) && indexLess(indexParent(nodeIndex), nodeIndex) {
            indexExchange(nodeIndex, indexParent(nodeIndex))
            nodeIndex = indexParent(nodeIndex)
        }
    }

    private func sink(_ i: Int) {
        var nodeIndex = i
        while true {

            let child0 = indexChildren(nodeIndex).0
            let child1 = indexChildren(nodeIndex).1

            // Has no childs
            if child0 > array.count - 1 { return }

            // Has only one child
            if child0 == array.count - 1 {
                if indexLess(nodeIndex, child0) {
                    indexExchange(nodeIndex, child0)
                    nodeIndex = child0
                } else {
                    return
                }
            }

            // Has both childs
            if child1 < array.count {

                // Childs are smaller
                if indexLess(child0, nodeIndex) && indexLess(child1, nodeIndex) { return }

                if indexLess(child0, child1) {
                    indexExchange(nodeIndex, child1)
                    nodeIndex = child1
                } else {
                    indexExchange(nodeIndex, child0)
                    nodeIndex = child0
                }
            }
        }
    }

    private func indexLess(_ i: Int, _ j: Int) -> Bool {
        return array[i] < array[j]
    }

    private func indexExchange(_ i: Int, _ j: Int) {
        let aux = array[i]
        array[i] = array[j]
        array[j] = aux
    }

}

var pq = BinaryHeap<Int>()
pq.insert(element: 3)
pq.insert(element: 1)
pq.insert(element: 9)
pq.insert(element: 5)
pq.insert(element: 8)
pq.insert(element: 2)
pq.insert(element: 88)

print(pq.sort())


print(BinaryHeap(array: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]).sort())
