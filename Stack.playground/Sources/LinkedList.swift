import Foundation


class LinkedListNode<Element>: CustomStringConvertible {
    var previous: LinkedListNode?
    var next: LinkedListNode?
    var element: Element

    /// Complexity: O(1)
    init(element: Element, previous: LinkedListNode? = nil, next: LinkedListNode? = nil) {
        self.element = element
        self.next = next
        self.previous = previous
    }

    var description: String { return "Element: \(element)" }
}

public class LinkedList<Element>: CustomStringConvertible {

    //MARK: - Private implementation

    private var firstNode: LinkedListNode<Element>?
    private var lastNode: LinkedListNode<Element>?

    /// Returns the node at the specified index.
    /// Returns nil if the index is out of bounds
    /// - Complexity: O(n)
    private func nodeAtIndex(index: Int) -> LinkedListNode<Element>? {
        var actual = firstNode
        var actualIndex = 0
        while let unwrappedActual = actual {
            if actualIndex == index { return unwrappedActual }
            actual = unwrappedActual.next
            actualIndex = actualIndex + 1
        }
        return nil
    }

    //MARK: - Public interface

    /// - Complexity: O(1)
    public init() { }

    /// - Complexity: O(n)
    public convenience init(array: [Element]) {
        self.init()
        for element in array { append(element) }
    }

    /// - Complexity: O(n)
    public var count: Int {
        var qty = 0
        var actual = firstNode
        while let unwrappedActual = actual {
            qty = qty + 1
            actual = unwrappedActual.next
        }
        return qty
    }

    /// - Complexity: O(n)
    public func toArray() -> [Element] {
        var array = [Element]()
        var node = firstNode
        while let aNode = node {
            array.append(aNode.element)
            node = aNode.next
        }
        return array
    }

    /// - Complexity: O(1)
    public var first: Element? {
        return firstNode?.element
    }

    /// - Complexity: O(1)
    public var last: Element? {
        return lastNode?.element
    }

    /// - Complexity: O(1)
    public func append(element: Element) {
        let node = LinkedListNode(element: element, previous: lastNode, next: nil)
        if let lastNode = lastNode {
            lastNode.next = node
            node.previous = lastNode
            self.lastNode = node
        } else {
            firstNode = node
            lastNode = node
        }
    }

    /// - Complexity: O(n)
    public func objectAtIndex(index: Int) -> Element {
        if let node = nodeAtIndex(index) { return node.element }
        fatalError("Index \(index) out of bounds")
    }

    /// - Complexity: O(n)
    public func insert(element: Element, atIndex index: Int) {

        if index < 0 || index > count { fatalError("Index \(index) out of bounds") }

        let newNode = LinkedListNode(element: element)
        let previousNode = nodeAtIndex(index-1)
        let nextNode = nodeAtIndex(index)

        previousNode?.next = newNode
        newNode.previous = previousNode
        newNode.next = nextNode
        nextNode?.previous = newNode

        if previousNode == nil { firstNode = newNode }
        if nextNode == nil { lastNode = newNode }
    }

    /// - Complexity: O(n)
    public func printAllElements() {
        var actual = firstNode
        while let unwrappedActual = actual {
            print(unwrappedActual.element)
            actual = unwrappedActual.next
        }
    }

    /// - Complexity: O(1)
    public func removeLast() {
        lastNode = lastNode?.previous
        lastNode?.next = nil
        if lastNode == nil { firstNode = nil }
    }

    /// - Complexity: O(1)
    public func removeFirst() {
        firstNode = firstNode?.next
        firstNode?.previous = nil

        if firstNode == nil { lastNode = nil }
    }

    /// - Complexity: O(n)
    public func removeElementAtIndex(index: Int) {
        if index < 0 || index >= count { fatalError("Index \(index) out of bounds") }
        let nodeToDelete = nodeAtIndex(index)
        let previous = nodeToDelete?.previous
        let next = nodeToDelete?.next
        previous?.next = next
        next?.previous = previous

        if previous == nil { firstNode = next }
        if next == nil { lastNode = previous }
    }

    /// - Complexity: O(n)
    public subscript(index: Int) -> Element {
        return objectAtIndex(index)
    }

    public var description: String { return "\(toArray())" }
}
