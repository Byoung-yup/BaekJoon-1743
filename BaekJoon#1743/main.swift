//
//  main.swift
//  BaekJoon#1743
//
//  Created by 김병엽 on 2023/11/16.
//

import Foundation

func solution() -> Int {
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m, k) = (input[0], input[1], input[2])

    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    var result: Int = 0
    var count: Int = 0
    
    for _ in 0..<k {
        let tresh = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[tresh[0] - 1][tresh[1] - 1] = 1
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    func dfs(x: Int, y: Int) {
        
        var queue = [(x, y)]
        var idx = 0
        
        while queue.count > idx {
            
            let q = queue[idx]
            idx += 1
            
            for i in 0..<4 {
                
                let nx = q.0 + dx[i]
                let ny = q.1 + dy[i]
                
                if nx >= 0 && ny >= 0 && nx < n && ny < m && map[nx][ny] == 1 && visited[nx][ny] == false {
                    
                    visited[nx][ny] = true
                    count += 1
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 && visited[i][j] == false {
                
                count += 1
                visited[i][j] = true
                dfs(x: i, y: j)
                if result < count { result = count }
                count = 0
            }
        }
    }
    
    return result
}

print(solution())
