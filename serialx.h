#ifndef SERIALX_H
#define SERIALX_H

#include <QtSerialPort/QSerialPort>
#include <QObject>
#include "/home/piotr/Arduino/libraries/ParamPart/src/parampart_pcs.h"

class TManager;


class SerialX : public QObject
{
    Q_OBJECT

    friend class TManager;
protected:
    QSerialPort *sP;

private:
 TManager * m_Manager_ptr;

public:
    SerialX();
    void InstallToManager(TManager * M) {m_Manager_ptr=M;};
    void begin(const QString& dev, const int& baudrate);
    void end();
    void write(const QString& msg,const int& LogAs=2);


public slots:
    void beginSlot(const QString& dev, const int& baudrate);
    void closeSlot();
    void writeSlot(const QString& msg);
    void readData();
  //  void Log(const QString& Line);

signals:
    QString getNewData(const QString& data);
  //  QString getLog(const QString& Line);



};






#endif
