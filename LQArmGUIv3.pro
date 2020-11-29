QT += quick
QT += serialport

CONFIG += c++11
CONFIG += qmltypes


QML_IMPORT_NAME = io.qt.examples.backend
QML_IMPORT_MAJOR_VERSION = 1

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        clock.cpp \
        lib/ParamPart/src/parampart_pcs.cpp \
        main.cpp \
        mixer.cpp \
        serialx.cpp \
        slotmaster.cpp \
        tmanager.cpp \
        tstatustable.cpp

RESOURCES += qml.qrc

TRANSLATIONS += \
    LQArmGUIv3_pl_PL.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    static/cmp.png \
    static/console.png \
    static/cpu.png \
    static/list.png \
    static/s.png \
    static/shot-glass_empty.png \
    static/shot-glass_full.png \
    static/solar-system.png \
    static/table.png \
    static/whiskey.png

HEADERS += \
    clock.h \
    lib/ParamPart/src/parampart_pcs.h \
    mixer.h \
    serialx.h \
    slotmaster.h \
    tmanager.h \
    tstatustable.h

