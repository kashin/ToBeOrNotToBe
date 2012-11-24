import bb.cascades 1.0
import tb.ntb 1.0

TabbedPane {
    showTabsOnActionBar: true

// Menu
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                id: muteAction
                imageSource: "asset:///images/sounds_on.png"
                title: qsTr("Sounds on")

                function updateSoundsAction() {
                    if (applicationSettings.mute) {
                        imageSource = "asset:///images/sounds_off.png";
                        title = qsTr("Sounds off");
                    } else {
                        imageSource = "asset:///images/sounds_on.png";
                        title = qsTr("Sounds on");
                    }
                }
                onTriggered: {
                    applicationSettings.mute = !applicationSettings.mute;
                    updateSoundsAction();
                }
                onCreationCompleted: {
                    updateSoundsAction();
                }
            }
        ]
        helpAction: HelpActionItem {
            id: aboutHelpAction
            title: qsTr("About")
            property variant createdSheet: 0

            function onSheetClosed() {
                delete createdSheet;
                createdSheet = 0;
            }

            onTriggered: {
                createdSheet = aboutSheetDef.createObject(parent);
                createdSheet.closed.connect(onSheetClosed);
                createdSheet.open();
            }
        }
        settingsAction: SettingsActionItem {
                            id: settingsAction
                            onTriggered: {
                                settingsSheet.open();
                            }
                        }
        attachedObjects: [
            // FIXME: Workaround for "application can't handle 'exit' signal"
            // Adds a different problem with couple of "ERROR: Context: Object name=" <ObjectName> " [objectId= <id> ] not unrealized" errors
            ComponentDefinition {
                id: aboutSheetDef
                content: Sheet {
                    id: aboutSheet
                    peekEnabled: false
                    content: Page {
                        Container {
                            id: aboutContainer
                            background: Color.Black
                            AboutWebView {
                            }
                            Button {
                                text: "Close"
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                onClicked: {
                                    aboutSheet.close();
                                }
                            }
                        } // aboutContainer
                    } // Page
                } // aboutSheet
            }, // ComponentDefinition
            SettingsSheet {
                id: settingsSheet
            },
            Settings {
                id: applicationSettings
            }
        ]
    }

//Tabs
    Tab {
        title: qsTr("Loves Me Or Not")
        LovesMeTab {
            id: lovesMeTab
        }
    }
    Tab {
        title: qsTr("Tab 2")
        Page {
            id: tab2
            actions: [ 
            //-- define the actions for tab here
            ActionItem {
                    title: qsTr("Raise")
                    onTriggered: {
                        //-- run the image animation
                        raiseAnimation.play();
                    }
                }
            ]
            Container {
                //-- define tab content here
                layout: StackLayout  {
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    text: qsTr("Tab 2 title")
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                ImageView {
                    id: imgTab2
                    imageSource: "asset:///images/picture1.png"
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    scalingMethod: ScalingMethod.AspectFit
                    opacity: 0.2
                    animations: [
                        //-- define animations for image here
                        FadeTransition {id: raiseAnimation; fromOpacity: 0.2; toOpacity: 1; duration: 1000}                                         
                    ]
                }
            }
        }
    }
    Tab {
        title: qsTr("Tab 3")
        Page {
            id: tab3
            Container {
                //-- define tab content here
                layout: StackLayout  {
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    text: qsTr("Tab 3 title")
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                Container {
                    layout: DockLayout {
                    }
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        text: qsTr ("Tab 3 content")
                    }
                }
            }
        }
    }
}
