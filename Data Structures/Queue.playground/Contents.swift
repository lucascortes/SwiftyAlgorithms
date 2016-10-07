import Foundation


public class Queue<Element>: CustomStringConvertible {

    private var linkedList = LinkedList<Element>(array: [Element]())

    // - Complexity: O(1)
    public init() { }

    // - Complexity: O(n)
    public convenience init(array: [Element]) {
        self.init()
        var i = array.count - 1
        while i >= 0 {
            enqueue(array[i])
            i = i - 1
        }
    }

    // - Complexity: O(1)
    public func enqueue(_ element: Element) -> Element {
        linkedList.insert(element: element, atIndex: 0)
        return element
    }

    // - Complexity: O(1)
    public func dequeue() -> Element? {
        let top = linkedList.last
        linkedList.removeLast()
        return top
    }

    // - Complexity: O(1)
    public var peek: Element? {
        return linkedList.last
    }

    // - Complexity: O(n)
    public func toArray() -> [Element] {
        return linkedList.toArray()
    }

    public var description: String { return "\(toArray())" }
}
