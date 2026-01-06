import Foundation

extension String {
    var formattedBirthday: String {
        let inputFormats = [
            "yyyy-MM-dd",
            "dd/MM/yyyy",
            "MM-dd-yyyy",
            "dd-MM-yyyy",
            "yyyy/MM/dd"
        ]
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yyyy"
        outputFormatter.locale = Locale(identifier: "tr_TR")
        
        for format in inputFormats {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = format
            inputFormatter.locale = Locale(identifier: "en_US_POSIX")
            
            if let date = inputFormatter.date(from: self) {
                return outputFormatter.string(from: date)
            }
        }
        
        return self 
    }
}

