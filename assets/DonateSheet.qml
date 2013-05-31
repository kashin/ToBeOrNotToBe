import bb.cascades 1.0

Sheet {
    id: donateSheet
    content: Page {
        content: Container {
            layout: DockLayout {}
            TextArea {
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                preferredHeight: 650
                editable: false
                text: qsTr("<html><p style=\"text-align:center;font-size:37px\">Hello, thank you that you downloaded this application! Now demo application is actually the same application as ToBeOrNotToBe, but with this screen shown on a startup :) If you like this application and want to donate us some money or you are looking for some additional info, please visit our <a href=\"http://kashin.github.com/ToBeOrNotToBe/\">support page</a>.<br/>If you have any questions, suggestions and/or requests feel free to write an email to <a href=\"mailto:askmrdon@gmail.com\">askmrdon@gmail.com</a>.</p></html>")
            }
            TextArea {
                verticalAlignment: VerticalAlignment.Bottom
                horizontalAlignment: HorizontalAlignment.Center
                editable: false
                text: qsTr("<html><p style=\"color:green;text-align:center;font-size:34px\">Tap any part of this green text to close this window.</p></html>")
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
                            donateSheet.close()
                        }
                    }
                ]
            }
        }
    }
}
