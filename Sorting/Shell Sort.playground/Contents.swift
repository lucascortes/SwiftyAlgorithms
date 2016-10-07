import Foundation

extension Array where Element: Comparable {

    public func shellSort(hValue: Int) -> Array {
        var array = self
        for i in 0..<array.count {
            for j in stride(from: i, to: 0, by: -hValue) {
                let prev = j - hValue
                if prev >= 0 && array[j] < array[prev] {
                    swap(&array[j], &array[prev])
                } else {
                    break
                }
            }
        }
        return array
    }

    public func shellSort() -> Array {

        let initialhValue = Int((count - 1)/3)
        var array = self

        for i in stride(from: initialhValue, to: -1, by: -1) {
            let hValue = 3 * i + 1
            array = array.shellSort(hValue: hValue)
        }

        return array
    }
    
}

[1,5,3,8,5,3,0,9,99,0].shellSort()
print(["m","o","l","e","e","x","a","s","p","r","t"].shellSort(hValue: 3))

