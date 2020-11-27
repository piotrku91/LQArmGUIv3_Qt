#ifndef TMANAGER_H
#define TMANAGER_H

#include <QObject>
#include "lib/ParamPart/src/parampart_pcs.h"

class SerialX;
class SlotMaster;
class Mixer;

class TManager:public QObject

{
    Q_OBJECT
  private:
  //Managed object pointers
  ParamPart *m_ParamPart_ptr;
  SlotMaster *m_SM_ptr;
  SerialX *m_Serial_ptr;
  Mixer *m_Mixer_ptr;

  public:

  //Constructor
  TManager()=delete;
  explicit TManager(ParamPart* PP, SlotMaster* SM, Mixer* M, SerialX* QSP, QObject *parent = nullptr): m_ParamPart_ptr(PP),m_SM_ptr(SM),m_Serial_ptr(QSP),m_Mixer_ptr(M) {};


  //Functions

  bool newJob(const QString& requestLine);
  void Reaction(ParamPart &P);
  void SendSaveSlots();
  void SendSaveDrink();
  void Log(const QString& Line,const int& Interface=0);

signals:
   QString addLog(const QString& Line, const QString& Interface="SYSTEM", const QString& Color="red");
};


#endif // TMANAGER_H
