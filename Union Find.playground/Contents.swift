import Foundation

public class QuickFind {

    private var setId: [Int]

    /// Complexity: O(n)
    public init(_ objectsQty: Int) {
        setId = Array(repeating: 0, count: objectsQty)
        for i in 0..<setId.count { setId[i] = i }
    }

    /// Complexity: O(1)
    public func connected(_ p: Int, _ q: Int) -> Bool {
        return setId[p] == setId[q]
    }

    /// Complexity: O(n)
    public func union(_ p: Int, _ q: Int) {
        if connected(p, q) { return }

        let pId = setId[p]
        let qId = setId[q]

        for i in 0..<setId.count { if setId[i] == qId { setId[i] = pId } }
    }

}

public class QuickUnion {

    private var parent: [Int]

    /// Complexity: O(n)
    public init(_ objectsQty: Int) {
        parent = Array(repeating: 0, count: objectsQty)
        for i in 0..<parent.count { parent[i] = i }
    }

    /// Complexity: O(n)
    private func root(_ p: Int) -> Int {
        var i = p
        while i != parent[i] { i = parent[i] }
        return i
    }

    /// Complexity: O(n)
    public func connected(_ p: Int, _ q: Int) -> Bool {
        return root(p) == root(q)
    }

    /// Complexity: O(n)
    public func union(_ p: Int, _ q: Int) {
        if root(p) == root(q) { return }
        parent[root(p)] = root(q)
    }
    
}

public class WeightedQuickUnion {

    private var parent: [Int]
    private var sizes: [Int]

    /// Complexity: O(n)
    public init(_ objectsQty: Int) {
        sizes = Array(repeating: 1, count: objectsQty)
        parent = Array(repeating: 0, count: objectsQty)
        for i in 0..<parent.count { parent[i] = i }
    }

    /// Complexity: O(log n)
    private func root(_ p: Int) -> Int {
        var i = p
        while i != parent[i] { i = parent[i] }
        return i
    }

    /// Complexity: O(log n)
    public func connected(_ p: Int, _ q: Int) -> Bool {
        return root(p) == root(q)
    }

    /// Complexity: O(log n)
    public func union(_ p: Int, _ q: Int) {
        let pRoot = root(p)
        let qRoot = root(q)

        if pRoot == qRoot { return }

        if sizes[pRoot] <= sizes[qRoot] {
            parent[pRoot] = qRoot
            sizes[qRoot] += sizes[pRoot]
        } else {
            parent[qRoot] = pRoot
            sizes[pRoot] += sizes[qRoot]
        }

    }
    
}


let qf = QuickFind(5)

qf.union(0, 1)
qf.union(3, 4)
qf.union(4, 3)
qf.union(1, 4)

qf.connected(0, 1)
qf.connected(0, 2)
qf.connected(0, 3)
qf.connected(0, 4)
qf.connected(3, 4)