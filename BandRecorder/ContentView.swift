import SwiftUI

struct ContentView: View {
    @State var isRecord = false
    @State var startButtonText = "●"
    @State var startButtonColor = Color.red
    @State var stopButtonText = "■"
    @State var stopButtonColor = Color.black

    var body: some View {
        VStack(alignment: .center) {
            Text(":::::RECORD:::::")
                .padding()

            HStack() {
                Button(action: {
                    if (self.isRecord) {
                        self.startButtonText = "●"
                        self.isRecord = false
                        self.startButtonColor = Color.red
                    } else {
                        self.startButtonText = "||"
                        self.isRecord = true
                        self.startButtonColor = Color.black
                    }
                },label: {
                    Text(self.startButtonText)
                        .foregroundColor(self.startButtonColor)
                })
                .frame(width: 50, height: 50)
                
                Button(action: {
                    if (self.isRecord) {
                        self.startButtonText = "●"
                        self.stopButtonText = "■"
                        self.isRecord = false
                        self.startButtonColor = Color.red
                        self.stopButtonColor = Color.black
                    } else {
                        //
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
