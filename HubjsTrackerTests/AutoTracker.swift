import Foundation
@testable import HubjsTracker

extension TrackerSpec {
    
    internal final class AutoTracker {
        
        let tracker: HubjsTracker
        let interval: TimeInterval
        var timer: Timer?
        
        init(tracker: HubjsTracker, trackingInterval: TimeInterval) {
            self.tracker = tracker
            self.interval = trackingInterval
        }
        
        @objc private func track() {
            tracker.queue(event: EventFixture.event())
        }
        
        func start() {
            self.timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(track), userInfo: nil, repeats: true)
        }
        
        func stop() {
            self.timer?.invalidate()
        }
        
    }
    
}
