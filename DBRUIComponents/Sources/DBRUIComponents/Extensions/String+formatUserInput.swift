//
//  String+formatUserInput.swift
//  DBRUIComponents
//
//  Created by Анастасия Журавлева on 17.03.2025.
//

extension String {
    
    func formatUserInput(type: DBRInputType) -> String {
        var processedInput = self
        let pattern = type.inputPattern
        
        guard let pattern else { return processedInput }
                
        if type == .phone {
            processedInput = processedInput.filter { $0.isNumber }
            
            if let first = processedInput.first, first == "8" {
                processedInput.removeFirst()
                processedInput.insert("7", at: processedInput.startIndex)
            }
        }
        
        var input = Array(processedInput)
        var result = [Character]()
        
        for patternChar in pattern {
            guard let nextInputChar = input.first else { break }

            if patternChar == nextInputChar || patternChar == "#" {
                result.append(nextInputChar)
                input.removeFirst()
            } else {
                result.append(patternChar)
            }
        }
        
        return String(result)
    }
}
