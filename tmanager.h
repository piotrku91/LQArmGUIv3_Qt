#ifndef TMANAGER_H
#define TMANAGER_H

#include <QObject>
#include <QFile>
#include <QDir>
#include "lib/ParamPart/src/parampart_pcs.h"
 #include <QtMultimedia/QMediaPlayer>
#include "tstatustable.h"
#include "clock.h"
#include <unistd.h>


class SerialX;
class SlotMaster;
class Mixer;
class TStatusTable;

class TManager:public QObject

{
    Q_OBJECT
    friend class SlotMaster;

  private:
  //Managed object pointers
  ParamPart *m_ParamPart_ptr;
  SlotMaster *m_SM_ptr;
  SerialX *m_Serial_ptr;
  Mixer *m_Mixer_ptr;
  Clock *m_clocky_ptr;
  TStatusTable *m_Table_ptr;
  QMediaPlayer *player = new QMediaPlayer(NULL,QMediaPlayer::LowLatency);



  public:


  //Constructor
  TManager()=delete;
  explicit TManager(ParamPart *PP, SlotMaster *SM, Mixer *M, SerialX *QSP, TStatusTable *ST, Clock *CL, QObject *parent = nullptr)
      : QObject(parent),m_ParamPart_ptr(PP),m_SM_ptr(SM),m_Serial_ptr(QSP),m_Mixer_ptr(M),m_Table_ptr(ST),m_clocky_ptr(CL)
  {

  };


  //Functions

  bool newJob(const QString& requestLine);
  void Reaction(ParamPart &P);
  void DeviceReady() {
      player->setMedia(QUrl::fromLocalFile("/home/piotr/Pobrane/ding2.wav"));
      player->setVolume(30); player->play();
    // usleep(2000000);
    //  sendToDevice("<boot;>",4);
        unlockApp();

};
  void Log(const QString& Line,const int& Interface=0);



public slots:

  // Communication with device - main function
  void sendToDevice(const QString& cmd, const int& Interface); // Send normal message to device
  void slots_Save();                                           // Send slots to device
  void slots_Load() {sendToDevice("<db;>",4); };             // Load slots from device
  void drink_Save();                                        // Save drink schemes to device
  void drink_Load() {sendToDevice("<sch_ls;>",4);};            // Load drink schemes from device
  void glass_Save();                                           // Save glass settings to device
  void glass_Load() {sendToDevice("<n_i;>",4);};               // Load glass settings from device
  void executeDisp();                                          // Start action (move and dispense)

  //////////////////////////////////

  void saveLogToFile(const QString m_text)
  {
      QDir directory(".");
      QString Header="<body bgcolor='black'>";
      QFile file(directory.absolutePath()+"/logs/log"+m_clocky_ptr->getDateReformated()+".html");
      if(file.open(QIODevice::WriteOnly)) {
          QTextStream stream(&file);
          stream << Header << m_text;
      }
  }


signals:
   QString addLog(const QString& Line, const QString& Interface="SYSTEM", const QString& Color="red");
   void unlockApp();
};


#endif // TMANAGER_H
