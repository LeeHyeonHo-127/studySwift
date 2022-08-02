import Foundation

//백준 2525

//KOI 전자에서는 건강에 좋고 맛있는 훈제오리구이 요리를 간편하게 만드는 인공지능 오븐을 개발하려고 한다. 인공지능 오븐을 사용하는 방법은 적당한 양의 오리 훈제 재료를 인공지능 오븐에 넣으면 된다. 그러면 인공지능 오븐은 오븐구이가 끝나는 시간을 분 단위로 자동적으로 계산한다.

//또한, KOI 전자의 인공지능 오븐 앞면에는 사용자에게 훈제오리구이 요리가 끝나는 시각을 알려 주는 디지털 시계가 있다.

//훈제오리구이를 시작하는 시각과 오븐구이를 하는 데 필요한 시간이 분단위로 주어졌을 때, 오븐구이가 끝나는 시각을 계산하는 프로그램을 작성하시오.


var presentTime : [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var totalRequiredMinute : Int = Int(readLine()!)!
var roundUpHour : Int = 0
var tempForMinute : Int = 0
var endTime : [Int] = [0,0]

tempForMinute = presentTime[1] + totalRequiredMinute

if(tempForMinute > 59)
{
    roundUpHour = tempForMinute / 60
    tempForMinute = tempForMinute % 60
}

endTime[0] = presentTime[0] + roundUpHour
endTime[1] = tempForMinute

if(endTime[0] > 23)
{
    endTime[0] = endTime[0] % 24
}

print("\(endTime[0]) \(endTime[1])")


	
