#include "serialx.h"
#include "tmanager.h"
#include <QtSerialPort/QSerialPort>



SerialX::SerialX(): sP(new QSerialPort(this))
{

}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::begin(const QString& dev, const int& baudrate){

    sP->setPortName(dev);
    sP->setBaudRate(baudrate);
    sP->setFlowControl(QSerialPort::NoFlowControl);
    sP->setDataBits(QSerialPort::Data8);
    sP->setStopBits(QSerialPort::OneStop);
    m_Manager_ptr->Log("** Próba połączenia z urządzeniem: "+dev+ " (baudrate: "+QString::number(baudrate)+")",0);
    connect(sP,SIGNAL(readyRead()),this,SLOT(readData()));


 if (!sP->open(QIODevice::ReadWrite)) {m_Manager_ptr->Log("** Błąd - połączenie nieudane.",0);} else {m_Manager_ptr->Log("** Sukces - połączenie ustanowione.",0);};

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::end(){

    if (sP->isOpen()) {
    sP->close();
    m_Manager_ptr->Log("** Połączenie zakończone.");
}

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::write(const QString& msg,const int& LogAs){

    const QByteArray &messageArray = msg.toLocal8Bit();
    sP->write(messageArray);
    m_Manager_ptr->Log(msg, LogAs);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::beginSlot(const QString& dev, const int& baudrate){
   begin(dev,baudrate);

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::writeSlot(const QString& msg){
    write(msg);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::closeSlot(){
     end();
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void SerialX::readData(){

    if ((sP->isOpen()) && (sP->canReadLine())) {

        QByteArray requestData = 0;
        if (sP->canReadLine())
            requestData = sP->readLine(64);
    const QString request = QString::fromUtf8(requestData);
    std::string inter=request.toStdString();
    //Reader << inter;

   // Reader.Interpreter(Reaction);
    m_Manager_ptr->newJob(request);

    m_Manager_ptr->Log(request,3);

     //   if (request!="") emit getNewData(request);
    }

}








