import Foundation

extension Array where Element: Comparable {

    public func selectionSort() -> Array {
        var array = self
        for i in 0..<array.count {
            var minIndex = i
            for j in i+1..<array.count {
                if array[j] < array[minIndex] { minIndex = j }
            }
            if i != minIndex { swap(&array[i], &array[minIndex]) }
        }
        return array
    }
}

[1,5,3,8,5,3,0,9,99,0].selectionSort()
