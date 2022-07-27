import Foundation



var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = arr[0]
let b = arr[1]

if(a>b){
    print(">")
}
else if(a<b)
{
    print("<")
}
else
{
    print("==")
}

