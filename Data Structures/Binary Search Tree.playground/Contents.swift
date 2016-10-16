import Foundation

public class BinarySearchTreeNode<Key: Comparable, Value> {
    fileprivate var key: Key
    fileprivate var value: Value
    fileprivate var left: BinarySearchTreeNode?
    fileprivate var right: BinarySearchTreeNode?

    fileprivate init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
}

public class BinarySearchTree<Key: Comparable, Value> {

    //MARK: - Private properties

    private var root: BinarySearchTreeNode<Key, Value>?

    //MARK: - Public methods

    public func put(key: Key, value: Value) {
        root = put(node: root, key: key, value: value)
    }

    public func get(key: Key) -> Value? {
        var node: BinarySearchTreeNode? = root
        while let unwrappedNode = node {
            if key == unwrappedNode.key { return unwrappedNode.value }
            else if key > unwrappedNode.key { node = unwrappedNode.right }
            else { node = unwrappedNode.left }
        }
        return nil
    }

    public func delete(key: Key) {

    }

    //MARK: - Private methods

    private func put(node: BinarySearchTreeNode<Key, Value>?, key: Key, value: Value) -> BinarySearchTreeNode<Key, Value>? {

        guard let node = node else { return BinarySearchTreeNode(key: key, value: value) }

        if key < node.key {
            node.left = put(node: node.left, key: key, value: value)
        } else if key > node.key {
            node.right = put(node: node.right, key: key, value: value)
        } else {
            node.value = value
        }

        return node
    }

}


let tree = BinarySearchTree<Int, Int>()
let nums = [3,7,33,2,6,0,7,31,23,86,22,23,41,18,90,5,76,22,31,1]
for num in nums {
    tree.put(key: num, value: num + 1)
}

for num in nums {
    print(tree.get(key: num) == num + 1)
}
