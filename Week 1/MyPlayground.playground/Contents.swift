import UIKit
import Foundation

//Excercise 1
for n in 1...20{
    print(n)
}

//Excercise 2

//FOR LOOPS
for num in 1..<21{
    if num % 2 == 1{
        print(num)
    }
}
//OR
for i in stride(from: 1, to: 20, by: 2){
    print(i)
}

//Excercise 3
var total = 0
for i in stride(from: 1, to: 20, by: 2){
    total += i
}
print(total)



//Example 2
func sayIT (aNumber: Int) {
    print ("You pass a " + String(aNumber))
}

sayIT(aNumber: 5)

//Excercise 4
func result(mark: Int)-> String{
    if mark>=50{
        return "Pass"
    }
    else {
        return "Fail"
    }
}

print(result(mark: 49))
print(result(mark: 50))

//Excercise 5

var numbers:[Int] = []
for _ in 1...10 {
    numbers.append(Int.random(in: 0 ... 100))
}


print(numbers)

func findMax(n: [Int])->Int{
    //var max = num[0]
    //for num in n{
    //  if num > max{
    //      max = num
    //  }
    //}
    //return max
    return n.max()!
}

print(findMax(n: numbers))

//Excercise 6

func findMin(n: [Int])->Int{

    return n.min()!
}

print(findMin(n: numbers))

//Example 7

func findAverage(n: [Int]) -> Double{
    //var total = 0;
    //for num in n{
    //    total += num
    //}
    //return total / Double(n.count)
    return Double(n.reduce(0,+) / n.count)
}

print(findAverage(n: numbers))

