#include "app.hpp"
#include "BallLogic.hpp"
#include "BallLogic.cpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

//#include "BallLogic.h"

using namespace bb::cascades;

App::App()
{
    QmlDocument *qml = QmlDocument::create("asset:///main.qml");
    //-- setContextProperty expose C++ object in QML as an variable
    //-- uncomment next line to introduce 'this' object to QML name space as an 'app' variable
    //qml->setContextProperty("app", this);

    qmlRegisterType<BallLogic>("my.library", 1, 0, "BallLogic");

    AbstractPane *root = qml->createRootObject<AbstractPane>();
    if (qml->hasErrors()) {
      qDebug() << qml->errors();
    }


    Application::instance()->setScene(root);
}
