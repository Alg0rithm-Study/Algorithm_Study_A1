import Foundation

// 문제 해설:
// 신고당한 횟수가 k 이상이면 해당 ID는 정지됨
// 정지된 ID를 신고한 유저는 메일을 받음

// Logic:
// [신고당한자:신고자] dictionary 생성 -> 신고당한 횟수 산정
// [신고자:신고당한자] dictionary 생성 -> 정지된 ID와 중복된 개수 산정 (이 개수가 메일횟수임)
// 신고자 = reporter, 신고당한자 = reportee
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // 신고당한자:신고자 [repotee: reporters] -> 신고당한 횟수 산정
    var reportersByUser = [String: [String]]()
    // _ = id_list.map { reportersByUser[$0] = [] }  // dictionary default로 인해 필요 없어짐
    
    // 신고자:신고당한자 [reporter: reportee] -> 정지된 ID와 중복 개수 산정 = 메일횟수
    var reporteesByUser = [String: [String]]()
    // _ = id_list.map { reporteesByUser[$0] = [] }
    
    for reportCase in Set(report) { // 중복된 신고 제거
        let names = reportCase.components(separatedBy: " ")
        let reporter = names[0]
        let reportee = names[1]
        
        reportersByUser[reportee, default: []].append(reporter)
        reporteesByUser[reporter, default: []].append(reportee)
    }
    
    // 정지된 ID
    let bannedReportees = reportersByUser.filter { $0.value.count >= k }.keys
    
    // 반환값 처리
    var result = [Int]()
    
    for id in id_list {
        let reportees = reporteesByUser[id, default: []]
        let mailCount = Set(reportees).intersection(bannedReportees).count // 정지된 ID와 중복 개수 산정
//        let mailCount = reportees.filter { bannedReportees.contains($0) }.count // 주의 - 시간 초과
        result.append(mailCount)
    }

    return result
}
print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
