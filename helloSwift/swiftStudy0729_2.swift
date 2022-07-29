import Foundation

var a = 10
var b = 20

func swap(first : inout Int, second : inout Int)
{
    let temp = first
    first = second
    second = temp
}

var temp1 : Int = 1
var temp2 : Int = 2

swap(first : &temp1, second : &temp2)

print(temp1)
print(temp2)

