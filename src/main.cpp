#include "app.hpp"
#include "PieChart.h"

#include <stdio.h>
#include <QLocale>
#include <QTranslator>
#include <bb/cascades/Application>
#include "BallLogic.hpp"

using ::bb::cascades::Application;

void myMessageOutput(QtMsgType /*type*/, const char* msg){
               fprintf(stdout, "%s\n", msg);
               fflush(stdout);
}

int main(int argc, char **argv)
{
    //-- this is where the server is started etc
    Application app(argc, argv);
    
    qInstallMsgHandler(myMessageOutput);

    //-- localization support
    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString( "ToBeOrNotToBe_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }
    
    App mainApp;

    //-- we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    //-- when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
