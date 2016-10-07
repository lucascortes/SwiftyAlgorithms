import Foundation

extension Array where Element: Comparable {

    public func insertionSort() -> Array {
        var array = self
        for i in 1..<array.count {
            for j in stride(from: i, to: 0, by: -1) {
                if array[j] < array[j-1] {
                    swap(&array[j], &array[j-1])
                } else {
                    break
                }
            }
        }
        return array
    }

}

[1,5,3,8,5,3,0,9,99,0].insertionSort()
