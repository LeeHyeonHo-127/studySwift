import Foundation

let year : Int = Int(readLine()!)!

if(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) // 해당 년도가 4의 배수이면서 100의 배수가 아닐때. 혹은 200의 배수일 때
{
    print("1")
}

else
{
    print("0")
}
