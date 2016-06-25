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
    public func enqueue(element: Element) -> Element {
        linkedList.insert(element, atIndex: 0)
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

////////////////////////////////////////////////

func assertTrue(assertion: Bool) -> String { return assertion ? "✅" : "❌" }

////////////////////////////////////////////////

// Test push, pop and Linked List to Swift array conversion

let stack1 = Queue<Int>()
assertTrue(stack1.push(1) == 1)
assertTrue(stack1.push(2) == 2)
assertTrue(stack1.push(3) == 3)
assertTrue(stack1.push(4) == 4)

assertTrue(stack1.toArray() == [1, 2, 3, 4])

assertTrue(stack1.pop() == 4)
assertTrue(stack1.pop() == 3)
assertTrue(stack1.toArray() == [1, 2])
assertTrue(stack1.pop() == 2)
assertTrue(stack1.pop() == 1)

assertTrue(stack1.toArray() == [])

// Test Init with Swift Array

let stack2 = Queue(array: [Int]())
assertTrue(stack2.toArray() == [])

let stack3 = Queue(array: [1])
assertTrue(stack3.toArray() == [1])

let stack4 = Queue(array: [1, 2, 3])
assertTrue(stack4.toArray() == [1, 2, 3])

// Test top property

let stack5 = Queue(array: [1, 2, 3])
assertTrue(stack5.top == 3)

let stack6 = Queue(array: [Int]())
assertTrue(stack6.top == nil)

stack6.push(5)
assertTrue(stack6.top == 5)
