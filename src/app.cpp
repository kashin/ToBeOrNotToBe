#include "app.hpp"
#include "BallLogic.hpp"
#include "BallView.hpp"
#include "RotationSensor.hpp"
//#include "AccelerationSensor.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include "Settings.h"
#include "TBNTBMediaPlayer.h"

using namespace bb::cascades;

App::App()
{
    QCoreApplication::setOrganizationName("MasterDon");
    QCoreApplication::setApplicationName("ToBeOrNotToBe");
    qmlRegisterType<Settings>("tb.ntb", 1, 0, "Settings");
    qmlRegisterType<TBNTBMediaPlayer>("tb.ntb", 1, 0, "SoundPlayer");

    QmlDocument *qml = QmlDocument::create("asset:///main.qml");

    qmlRegisterType<BallLogic>("tb.ntb", 1, 0, "BallLogic");
    //qmlRegisterType<RotationSensor>("custom.sensors", 1,0, "RotationSensor");
    qmlRegisterType<BallView>("custom.lib", 1,0, "BallView");
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    if (qml->hasErrors()) {
      qDebug() << qml->errors();
    }


    Application::instance()->setScene(root);
}
