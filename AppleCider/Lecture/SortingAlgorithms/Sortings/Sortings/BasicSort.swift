import Foundation

func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
  // There is no need to sort the collection if it has less than two elements.
  guard array.count >= 2 else {
    return
  }
  // A single-pass bubbles the largest value to the end of the collection.
  //Every pass needs to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
  for end in (1..<array.count).reversed() {
    var swapped = false
    // This loop performs a single pass; it compares adjacent values and swaps them if needed.
    for current in 0..<end {
      if array[current] > array[current + 1] {
        array.swapAt(current, current + 1)
        swapped = true
      }
    }
    //If no values were swapped this pass, the collection must be sorted, and you can exit early.
    if !swapped {
      return
    }
  }
}

func selectionSort<Element: Comparable>(_ array: inout [Element]) {
  guard array.count >= 2 else {
    return
  }
  
  for current in 0..<(array.count - 1) {
    var lowest = current
    
    for other in (current + 1)..<array.count {
      if array[lowest] > array[other] {
        lowest = other
      }
    }
    if lowest != current {
      array.swapAt(lowest, current)
    }
  }
}

func insertionSort<Element: Comparable>(_ array: inout [Element]) {
  guard array.count >= 2 else {
    return
  }
  
  for current in 1..<array.count {
    for shifting in (1...current).reversed() {
      if array[shifting] < array[shifting - 1] {
        array.swapAt(shifting, shifting - 1)
      } else {
        break
      }
    }
  }
}
