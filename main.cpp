#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "lib/ParamPart_PCSide/parampart_pcs.h"

#include "clock.h"
#include "mixer.h"
#include "serialx.h"
#include "slotmaster.h"
#include "tmanager.h"
#include "tstatustable.h"

#define LAYOUT_COLOR_MAIN1 #f9842d

int main(int argc, char* argv[]) {
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    // Objects initialization
    Clock clocky;
    TStatusTable gtable;
    Mixer mixer(&gtable);
    SerialX serial;
    ParamPart Reader;
    SlotMaster SlotM(&mixer);

    TManager Manager(&Reader, &SlotM, &mixer, &serial, &gtable, &clocky);  // Push pointers of main objects to Manager object
    serial.InstallToManager(&Manager);                                     // Connect callback pointer to Manager from serial.

    // Give access to main objects from QML
    context->setContextProperty("gtable", &gtable);
    context->setContextProperty("serial", &serial);
    context->setContextProperty("clocky", &clocky);
    context->setContextProperty("mixer", &mixer);
    context->setContextProperty("slotmaster", &SlotM);
    context->setContextProperty("manager", &Manager);

    engine.load(url);

    serial.begin("ttyUSB0", 9600);  // Connect serial port

    return app.exec();
}
