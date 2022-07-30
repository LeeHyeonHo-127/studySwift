import Foundation

var alphabet : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var word = readLine()!.map{String($0)}
var frequently : Int = 0
var biggest : Int = 0

for i in 0..<word.count
{
    let number: Int = Int(UnicodeScalar(word[i])!.value)
    if(number > 91)
    {
        alphabet[number-97] = alphabet[number-97] + 1
    }
    else
    {
        alphabet[number-65] = alphabet[number-65] + 1
    }
}

for i in 0..<alphabet.count
{
    if(alphabet[i] > biggest)
    {
        frequently = i
        biggest = alphabet[i]
    }
}

print(String(UnicodeScalar(frequently+65)!))


