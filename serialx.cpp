#include "serialx.h"
#include "tmanager.h"
#include <QtSerialPort/QSerialPort>



SerialX::SerialX(): sP(new QSerialPort(this)),IsTransaction(false)
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


 if (!sP->open(QIODevice::ReadWrite)) {m_Manager_ptr->Log("** Błąd - połączenie nieudane.",1);} else {m_Manager_ptr->Log("** Sukces - połączenie ustanowione.",0); m_Manager_ptr->DeviceReady();};

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


   // sP->flush();

    m_Manager_ptr->Log(msg, LogAs);
    // usleep(2000000);

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

    while ((sP->isOpen()) && (sP->canReadLine()) && (!IsTransaction)) {

        QByteArray requestData = 0;
        if (sP->canReadLine())
            requestData = sP->readLine(1024);

    const QString request = QString::fromUtf8(requestData);

   // Reader.Interpreter(Reaction);
    m_Manager_ptr->Log(request,3);
   m_Manager_ptr->newJob(request);



    }

}


void SerialX::Transaction (const QString& cmd)
{
    IsTransaction=true;
    int m_waitTimeout = 2000;
    QString currentRequest;
    const QByteArray requestData = currentRequest.toUtf8();

   m_Manager_ptr->sendToDevice(cmd,4);
           if (sP->waitForBytesWritten(m_waitTimeout))
           {

               if (sP->waitForReadyRead(m_waitTimeout))
               {
                             QByteArray responseData = sP->readAll();
                             while (sP->waitForReadyRead(100))
                                 responseData += sP->readAll();

                             const QString response = QString::fromUtf8(responseData);
                            // m_Manager_ptr->Log(response);
                             //emit this->response(response);

               }


 };

 IsTransaction=false;



}








