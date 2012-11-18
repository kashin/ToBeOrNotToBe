import bb.cascades 1.0
import tb.ntb 1.0

Sheet {
    id: settingsSheet
    content: Page {
        titleBar: TitleBar {
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    settingsSheet.close();
                }
            }
        }

        Container {
            Label {
                text: qsTr("Flower's sample voice")
            }
            ToggleButton {
                id: flowerVoiceToggle
                checked: true
                onCheckedChanged: {
                    if (checked) {
                        applicationSettings.setValue("flowerVoice", "flowerDefaultVoice");
                    } else {
                        if (flowerVoicesDropDown.selectedOption != 0) {
                            applicationSettings.setValue("flowerVoice", flowerVoicesDropDown.selectedValue);
                        }
                    }
                }
            }
            DropDown {
                id: flowerVoicesDropDown
                visible: !flowerVoiceToggle.checked
            }
            Divider {
            }
        } // Container

        attachedObjects: [
            Settings {
                id: applicationSettings
            }
        ]
    } // Page
}

