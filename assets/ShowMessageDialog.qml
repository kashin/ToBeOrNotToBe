import bb.cascades 1.0

Dialog {
    id: showMessageDialog
    property string text: ""
    content: Container {
        layout: DockLayout {}
        background: Color.Black
        opacity: 0.8
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        Label {
            id: infolabel
            text: showMessageDialog.text
            multiline: true
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            textStyle {
                fontSize: FontSize.XLarge
                textAlign: TextAlign.Center
            }
        }
        Button {
            id: closeButton
            text: qsTr("Close")
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                showMessageDialog.close()
            }
        }
    }
}
