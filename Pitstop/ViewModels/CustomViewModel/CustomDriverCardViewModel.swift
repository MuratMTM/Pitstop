import Foundation

class CustomDriverCardViewModel: ObservableObject {
    @Published var customDriversViewModel: [Driver] = customDrivers
    
    init(customDriversViewModel: [Driver]) {
        self.customDriversViewModel = customDriversViewModel
    }
    
  
}
