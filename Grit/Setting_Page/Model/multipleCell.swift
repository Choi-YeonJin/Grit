//
//  multipleCell.swift
//  Grit
//
//  Created by yeonjin choi on 2020/12/24.
//
import Foundation

public enum CellType {
    case switchBtn
    case nextBtn
}

public struct Cell {
    public let subject : String
    public let type : CellType
    
    init(subject: String, type: CellType) {
        self.subject = subject
        self.type = type
    }
}
