//
//  DBRAnalysysViewConfig.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 12.06.2025.
//

import Foundation

public struct DBRAnalysysViewConfig {
    
    let title: String
    let adress: String
    let doctorName: String
    let date: String
    
    public init(
        title: String,
        adress: String,
        doctorName: String,
        date: String,
        timeStart: String,
        timeEnd: String
    ) {
        self.title = title
        self.adress = adress
        self.doctorName = doctorName
        self.date = "\(date ?? "") \(DBRAnalysysViewConfig.extractTime(from: timeStart) ?? "")-\(DBRAnalysysViewConfig.extractTime(from: timeEnd) ?? "")"
    }
    
    static private func extractTime(from dateTimeString: String?) -> String? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        df.locale = Locale.current
        df.timeZone = TimeZone.current
        
        guard let date = df.date(from: dateTimeString ?? "") else {
            return nil
        }
        
        df.dateFormat = "HH:mm"
        
        return df.string(from: date)
    }
}
