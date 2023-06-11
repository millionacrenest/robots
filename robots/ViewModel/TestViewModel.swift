import SwiftUI
import Combine

class TestViewModel : ObservableObject {
    public static let userDefaultTextKey = "textKey"
    @Published var text = UserDefaults.standard.string(forKey: TestViewModel.userDefaultTextKey) ?? ""
    private var canc: AnyCancellable!

    init() {
        canc = $text.debounce(for: 0.2, scheduler: DispatchQueue.main).sink { newText in
            UserDefaults.standard.set(newText, forKey: TestViewModel.userDefaultTextKey)
        }
    }

    deinit {
        canc.cancel()
    }
}
