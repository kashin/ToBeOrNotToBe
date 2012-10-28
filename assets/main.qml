import bb.cascades 1.0

TabbedPane {
    showTabsOnActionBar: true
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
