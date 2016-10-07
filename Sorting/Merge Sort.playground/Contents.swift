import Foundation

extension Array where Element: Comparable {

    ///Complexity: O(n * log(n))
    public func mergeSort() -> Array {
        var array = self
        var aux = array
        let n = array.count

        var subarraySize = 1
        var j = 0

        while subarraySize < n {
            while j < n {
                let low = j
                let hi = low + subarraySize * 2 - 1 < n - 1 ? low + subarraySize * 2 - 1 : n - 1
                let mid = low + subarraySize - 1
                merge(array: &array, aux: &aux, low: low, mid: mid, hi: hi)
                j += subarraySize * 2
            }
            j = 0
            subarraySize *= 2
        }

        return array
    }

    ///Complexity: O(n * log(n))
    public func recursiveMergeSort() -> Array {
        var array = self
        var aux = array
        sort(array: &array, aux: &aux, low: 0, hi: array.count-1)
        return array
    }

    ///Complexity: O((hi - low) * log((hi - low)))
    private func sort(array: inout Array, aux: inout Array, low: Int, hi: Int) {
        if hi <= low { return }
        let mid = Int((hi + low)/2)
        sort(array: &array, aux: &aux, low: low, hi: mid)
        sort(array: &array, aux: &aux, low: mid+1, hi: hi)
        merge(array: &array, aux: &aux, low: low, mid: mid, hi: hi)
    }

    /// Complexity: O(hi - low)
    private func merge(array: inout Array, aux: inout Array, low: Int, mid: Int, hi: Int) {

        // Copy concerning array slots into the auxiliar array
        for k in low...hi { aux[k] = array[k] }

        // Aux array indices iterators
        var i = low
        var j = mid + 1

        // Iterate through the array
        for k in low...hi {

            // The first half ended
            if i > mid {
                array[k] = aux[j]
                j += 1

                // The second half ended
            } else if j > hi {
                array[k] = aux[i]
                i += 1

                // Write from the first half
            } else if aux[i] < aux[j] {
                array[k] = aux[i]
                i += 1

                // Write from the second half
            } else {
                array[k] = aux[j]
                j += 1
            }
        }
    }
}

[7,7,1,9,8,4,2,3,6].recursiveMergeSort()
[7,7,1,9,8,4,2,3,6].mergeSort()

