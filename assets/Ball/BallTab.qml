import bb.cascades 1.0
//import Charts 1.0
import my.library 1.0

Page {
    
        signal btnClickSignal()
        
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
	           onClicked: {
	                onClicked:{ 
	                    btnClickSignal() 
	                    }
	                //myObj.mySlot();
	            }
        }
        attachedObjects: [
        BallLogic{
            id: button
            value: 1
            valueChanged: {
                labelProgress.setText("olala222");
            }
        }
    ]
            
        /*PieChart {
                     //id: aPieChart
                     //anchors.centerIn: parent
                     //width: 100; height: 100
                     name: "A simple pie chart"
                 }*/
        Divider {
                    
                }
        Button {
                    //text: myObj.someProperty
                    horizontalAlignment: HorizontalAlignment.Center
                    preferredWidth: 100
                    onClicked: 
                        {
                             ///start parameters
                             progressIndicator.setValue(progressIndicator.fromValue);                             
                             labelProgress.setText("Progress..."); 
                             
                             var i = 0;
                             var fillIndicator = 20;
                             var toValue = progressIndicator.toValue;
                             
                             for(i = 0; i < fillIndicator; i++){
                                 
                                 var val = (toValue / fillIndicator) * i;
                                 progressIndicator.setValue(val);
                                 
                                 console.log("******compare values******");
                                 console.log(val);
                                 console.log(progressIndicator.value);
                             }
                             
                             ///fin parameters
                             progressIndicator.setValue(progressIndicator.toValue);
                             labelProgress.setText("Progress complited"); 
                        }
                }
        /*Ball {
            id: ball
        }*/
        ProgressIndicator {
            id: progressIndicator
             
            horizontalAlignment: HorizontalAlignment.Center         
            fromValue: 0
            toValue: 100
            value: 0  
                    
        }
        Label {
                id: labelProgress
                text: "Progress..."
        }
    }
}
