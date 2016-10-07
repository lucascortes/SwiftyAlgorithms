import Foundation


public class PriorityQueue<Element: Comparable> {

    var array =  [Element]()

    //MARK: - Public interface

    public var isEmpty: Bool { return array.count == 0 }

    public func insert(element: Element) {
        array.append(element)
        swim(array.count - 1)
    }

    public func deleteMax() -> Element {
        let max = array[0]
        array[0] = array[array.count - 1]
        sink(0)
        return max
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
            if child0 == array.count - 1 && indexLess(nodeIndex, child0){
                indexExchange(nodeIndex, child0)
                nodeIndex = child0
            }

            // Has both childs
            if child1 < array.count {

                // Childs are greater
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

var pq = PriorityQueue<Int>()
pq.insert(element: 3)
pq.insert(element: 1)
pq.insert(element: 9)
pq.insert(element: 5)
pq.insert(element: 8)
pq.insert(element: 2)
pq.insert(element: 88)

print(pq.array)
