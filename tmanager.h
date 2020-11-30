#ifndef TMANAGER_H
#define TMANAGER_H

#include <QObject>
#include "lib/ParamPart/src/parampart_pcs.h"

class SerialX;
class SlotMaster;
class Mixer;
class TStatusTable;

class TManager:public QObject

{
    Q_OBJECT
  private:
  //Managed object pointers
  ParamPart *m_ParamPart_ptr;
  SlotMaster *m_SM_ptr;
  SerialX *m_Serial_ptr;
  Mixer *m_Mixer_ptr;
  TStatusTable *m_Table_ptr;

  public:

  //Constructor
  TManager()=delete;
  explicit TManager(ParamPart *PP, SlotMaster *SM, Mixer *M, SerialX *QSP, TStatusTable *ST, QObject *parent = nullptr)
      : QObject(parent),m_ParamPart_ptr(PP),m_SM_ptr(SM),m_Serial_ptr(QSP),m_Mixer_ptr(M),m_Table_ptr(ST)
  {





  };


  //Functions

  bool newJob(const QString& requestLine);
  void Reaction(ParamPart &P);
  void DeviceReady() {unlockApp();};


  void Log(const QString& Line,const int& Interface=0);

public slots:
  void sendToDevice(const QString& cmd, const int& Interface);
  void slots_Save() {};
  void slots_Load() {sendToDevice("<db;>",4);};
  void drink_Save() {};
  void drink_Load() {};
  void schemeChange_Save(const int& GlassIdx);

signals:
   QString addLog(const QString& Line, const QString& Interface="SYSTEM", const QString& Color="red");
   void unlockApp();
};


#endif // TMANAGER_H
