#ifndef SERIALX_H
#define SERIALX_H

#include <QtSerialPort/QSerialPort>
#include <QObject>
#include "/home/piotr/Arduino/libraries/ParamPart/src/parampart_pcs.h"

class SerialX : public QObject
{
    Q_OBJECT

protected:
    QSerialPort *sP;

public:
    SerialX();
    void begin(const QString& dev, const int& baudrate);
    void end();
    void write(const QString& msg);
    ParamPart proba;


public slots:
    void beginSlot(const QString& dev, const int& baudrate);
    void closeSlot();
    void writeSlot(const QString& msg);
    void readData();
    void Log(const QString& Line);

signals:
    QString getNewData(const QString& data);
    QString getLog(const QString& Line);



};

#endif
