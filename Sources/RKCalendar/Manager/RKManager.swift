//
//  RKManager.swift
//  RKCalendar
//
//  Created by Raffi Kian on 7/14/19.
//  Copyright © 2019 Raffi Kian. All rights reserved.
//

import SwiftUI

public class RKManager : ObservableObject {

    @Published public var calendar = Calendar.current
    @Published public var minimumDate: Date = Date()
    @Published public var maximumDate: Date = Date()
    @Published public var disabledDates: [Date] = [Date]()
    @Published public var selectedDates: [Date] = [Date]()
    @Published public var selectedDate: Date! = nil
    @Published public var startDate: Date! = nil
    @Published public var endDate: Date! = nil
    public var enabledDatesForSelection: [Date] = [Date]()
    
    @Published public var mode: Int = 0
    
    var colors = RKColorSettings()
  
    public init(calendar: Calendar, minimumDate: Date, maximumDate: Date, selectedDates: [Date] = [Date](), mode: Int, enabledForSelection: [Date] = []) {
        self.calendar = calendar
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.selectedDates = selectedDates
        self.mode = mode
        self.enabledDatesForSelection = enabledForSelection
    }
    
    public func selectedDatesContains(date: Date) -> Bool {
        if let _ = self.selectedDates.first(where: { calendar.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }
    
    public func selectedDatesFindIndex(date: Date) -> Int? {
        return self.selectedDates.firstIndex(where: { calendar.isDate($0, inSameDayAs: date) })
    }
    
    func isDateEnabledForSelection(_ date: Date) -> Bool {
        return self.enabledDatesForSelection.first(where: {
            calendar.isDate($0, inSameDayAs: date)
        }) != nil
    }
    
    public func disabledDatesContains(date: Date) -> Bool {
        if let _ = self.disabledDates.first(where: { calendar.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }
    
    public func disabledDatesFindIndex(date: Date) -> Int? {
        return self.disabledDates.firstIndex(where: { calendar.isDate($0, inSameDayAs: date) })
    }
    
}
