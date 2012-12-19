import bb.cascades 1.0
import tb.ntb 1.0
import custom.lib 1.0
//import custom.sensors 1.0
//import QtMobility.sensors 1.2

Page {

                id: magicBall
        //signal btnClickSignal()
        
    Container {
        Label {
            text: "Ask me..."
            horizontalAlignment: HorizontalAlignment.Center
        }
        Divider {
            
        }
                
        ImageView {
            id: ballView
            imageSource: "asset:///images/1.gif"
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            preferredHeight: 600
            preferredWidth: 600
            attachedObjects: [
                ImageAnimator {
                    id: ballAnimator
                    animatedImage: ballView.image
                    started: false
                }
            ]
            gestureHandlers: [
                TapHandler {
                    onTapped: {
                        if (ballAnimator.playing) {
                            ballAnimator.stopAt(1,2);
                        } else {
                            // start of stupid hack. Otherwise, for some reason animation is not started
                            var source = ballView.imageSource
                            ballView.imageSource = ""
                            ballView.imageSource = source
                            // end of stupid hack
                            ballAnimator.start()
                        }
                    }
                }
            ]
        }
         Divider {
                    
                }
         Button {
            id: buttonReset
            text: "Reset"
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 10
	           onClicked: {
	               
		               
	           }
	               //buttonReset.setText("dd");
	               //console.log("dd");
	                //myObj.mySlot();
	            }
        }       
        /*Divider {
                    
                }
        Button {
                    //text: myObj.someProperty
                    text: "Moooove me..."
                    horizontalAlignment: HorizontalAlignment.Center
                    preferredWidth: 100
                    onClicked: 
                        {
                             text: "OOOOOO"
                             ///start parameters
                             progressIndicator.setValue(progressIndicator.fromValue);                             
                             labelProgress.setText("Progress..."); 
                             
                             var i = 0;
                             var fillIndicator = 20;
                             var toValue = progressIndicator.toValue;
                             
                             for(i = 0; i < fillIndicator; i++){
                                 
                                 var val = (toValue / fillIndicator) * i;
                                 progressIndicator.setValue(val);
                                 ballControl.coordinateX = i;
                                 console.log("******compare values******");
                                 console.log(val);
                                 console.log(progressIndicator.value);
                                 
                             }
                             
                             ///fin parameters
                             progressIndicator.setValue(progressIndicator.toValue);
                             labelProgress.setText("Progress complited"); 
                        }
                }
        Ball{
            id: ballControl
        }
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
        }*/
        /*attachedObjects: [
                    Compass {
                        id: compass
                        active: true
                  
                        onReadingChanged: {
                            //labelProgress.text =  reading.azimuth;                    
                        }
                    }
                ]*/
    }

