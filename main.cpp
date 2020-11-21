#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include "/home/piotr/Arduino/libraries/ParamPart/src/parampart_pcs.h"
#include "serialx.h"
#include "clock.h"
#include "mixer.h"


SerialX serial;
ParamPart Reader;
//#include "backend.h"

#define LAYOUT_COLOR_MAIN1 #f9842d


void Reaction(ParamPart& P) { //temporary place for this function, (move to another cpp file)

    if (P.Header("artn")) {

  emit serial.getNewData("jest zwrot!");
    };



    P.ReadDone();




};

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

   //qmlRegisterType<BackEnd>("io.qt.examples.backend",1,0,"BackEnd");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);



        Clock clocky;
        Mixer mixer;


        context->setContextProperty("serial",&serial);
        context->setContextProperty("clocky",&clocky);
        context->setContextProperty("mixer",&mixer);

    engine.load(url);
    serial.begin("ttyACM0",9600);

    return app.exec();
}
