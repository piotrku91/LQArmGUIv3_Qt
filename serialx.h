#ifndef SERIALX_H
#define SERIALX_H

#include <QtSerialPort/QSerialPort>
#include <QObject>
#include "lib/ParamPart_PCSide/parampart_pcs.h"

class TManager;


class SerialX : public QObject
{
    Q_OBJECT

    friend class TManager;
protected:
    QSerialPort *sP;

private:
 TManager * m_Manager_ptr;
 bool IsTransaction;

public:
    SerialX();
    void InstallToManager(TManager * M) {m_Manager_ptr=M;};
    void begin(const QString& dev, const int& baudrate);
    void end();
    void write(const QString& msg,const int& LogAs=2);
    void Transaction(const QString& cmd);  // Writing data to serial and wait for response (disabling Read free mode for a moment)


public slots:
    void beginSlot(const QString& dev, const int& baudrate);
    void closeSlot();
    void writeSlot(const QString& msg); // Write slot (access from qml)
    void readData(); // Reading data from serial (free mode)


signals:
    QString getNewData(const QString& data);
    QString startBusy();
    QString stopBusy();
    QString jobFinish();
    QString jobStart(const QString& message);




};






#endif
