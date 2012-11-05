import bb.cascades 1.0

Page {
    Container {
        Label {
            text: "Ask me..."
            horizontalAlignment: HorizontalAlignment.Center
        }
        Divider {
            
        }
        Button {
            text: "Reset"
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 10
            onClicked: 
                {
                    ball.isAss = !ball.isAss;
                }
        }
        Ball {
            id: ball
        }
    }
}
