import Foundation


public class Stack<Element>: CustomStringConvertible {

    private var linkedList = LinkedList<Element>(array: [Element]())

    // - Complexity: O(1)
    public init() { }

    // - Complexity: O(n)
    public convenience init(array: [Element]) {
        self.init()
        for element in array { push(element) }
    }

    // - Complexity: O(1)
    public func push(element: Element) -> Element {
        linkedList.append(element)
        return element
    }

    // - Complexity: O(1)
    public func pop() -> Element? {
        let top = linkedList.last
        linkedList.removeLast()
        return top
    }

    // - Complexity: O(1)
    public var top: Element? {
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

let stack1 = Stack<Int>()
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

let stack2 = Stack(array: [Int]())
assertTrue(stack2.toArray() == [])

let stack3 = Stack(array: [1])
assertTrue(stack3.toArray() == [1])

let stack4 = Stack(array: [1, 2, 3])
assertTrue(stack4.toArray() == [1, 2, 3])

// Test top property

let stack5 = Stack(array: [1, 2, 3])
assertTrue(stack5.top == 3)

let stack6 = Stack(array: [Int]())
assertTrue(stack6.top == nil)

stack6.push(5)
assertTrue(stack6.top == 5)
