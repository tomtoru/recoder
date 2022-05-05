import SwiftUI

struct ContentView: View {
    // timer
    @State var timer: Timer?
    @State var progressTime: Int = 0
    var hours: Int {
        progressTime / 3600
    }
    var minutes: Int {
        (progressTime % 3600) / 60
    }
    var seconds: Int {
        progressTime % 60
    }
    let timeFormat = Font(UIFont.monospacedDigitSystemFont(ofSize: 50, weight: .light))

    // button
    @State var isRecord: Bool = false
    @State var startButtonText = "●"
    @State var startButtonColor = Color.red
    @State var stopButtonText = "■"
    @State var stopButtonColor = Color.black

    var body: some View {
        VStack(alignment: .center) {
            Text(":::::RECORD:::::")
                .padding()
                .font(.title2)
            
            HStack(alignment: .center, spacing: 10) {
                Text("\(self.hours, specifier: "%02d")")
                    .font(timeFormat)
                Text(":")
                    .font(timeFormat)
                Text("\(self.minutes, specifier: "%02d")")
                    .font(timeFormat)
                Text(":")
                    .font(timeFormat)
                Text("\(self.seconds, specifier: "%02d")")
                    .font(timeFormat)
            }

            HStack() {
                Button(action: {
                    if (self.isRecord) {
                        self.isRecord = false

                        // button change
                        self.startButtonText = "●"
                        self.startButtonColor = Color.red
                        
                        // timer stop
                        if let t = self.timer {
                            t.invalidate()
                        }
                        self.timer = nil
                    } else {
                        self.isRecord = true

                        // button change
                        self.startButtonText = "||"
                        self.startButtonColor = Color.black

                        // timer start
                        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
                            self.progressTime += 1
                        }
                    }
                },label: {
                    Text(self.startButtonText)
                        .foregroundColor(self.startButtonColor)
                })
                .frame(width: 50, height: 50)
                
                Button(action: {
                    if (self.isRecord) {
                        self.isRecord = false

                        // button init
                        self.startButtonText = "●"
                        self.stopButtonText = "■"
                        self.startButtonColor = Color.red
                        self.stopButtonColor = Color.black
                        
                        // timer stop and reset time
                        if let t = self.timer {
                            t.invalidate()
                        }
                        self.timer = nil
                        self.progressTime = 0
                    }
                },label: {
                    Text(self.stopButtonText)
                        .foregroundColor(self.stopButtonColor)
                })
                .frame(width: 50, height: 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
