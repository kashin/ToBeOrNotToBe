import bb.cascades 1.0
import tb.ntb 1.0

Sheet {
    id: settingsSheet

    content: Page {
        titleBar: TitleBar {
            branded: TriBool.False
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    settingsSheet.close();
                }
            }
        }

        Container {
            Label {
                text: qsTr("Use Flower's Sample Voice")
            }
            ToggleButton {
                id: flowerVoiceToggle
                checked: applicationSettings.useDefaultFlowerVoice
                onCheckedChanged: {
                    if (checked) {
                         applicationSettings.useDefaultFlowerVoice = true;
                    } else {
                        applicationSettings.useDefaultFlowerVoice = false;
                    }
                }
            }
            Divider {
            }
            CheckBox {
                id: muteButton
                text: qsTr("Mute sounds")
                checked: applicationSettings.mute
                onCheckedChanged: {
                    applicationSettings.mute = checked
                }
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

