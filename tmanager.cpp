#include "serialx.h"
#include "slotmaster.h"
#include "tmanager.h"
#include "tstatustable.h"


void TManager::glass_Save()
{
    for (int i=0; i < 5; i++)
    {
        if (m_Table_ptr->Glass[i].Checked)
        {
           m_Serial_ptr->Transaction("<n_set;"+QString::number(i)+';'+QString::number(m_Table_ptr->Glass[i].MaxCap)+';'+QString::number(m_Table_ptr->Glass[i].Locked)+';'+m_Table_ptr->Glass[i].DrinkScheme+";>");
       }
   }
};


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief TManager::executeDisp
///
///
///

 void TManager::executeDisp()
 {
      m_Serial_ptr->startBusy();
     QString tmpString;
     for (auto &oneShot : m_Table_ptr->Glass)
     { tmpString+=QString::number(oneShot.Checked)+';'; }
     m_Serial_ptr->Transaction("<n_que;"+tmpString+'>');

     glass_Save();

     m_Serial_ptr->Transaction("<srv_nalall;>");

     m_Serial_ptr->stopBusy();
 };


 void TManager::escape()
 {
      m_Serial_ptr->startBusy();

     m_Serial_ptr->Transaction("<srv_esc;>");

     m_Serial_ptr->stopBusy();
 };

 void TManager::home()
 {
      m_Serial_ptr->startBusy();

     m_Serial_ptr->Transaction("<srv_home;>");

     m_Serial_ptr->stopBusy();
 };

 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /// \brief TManager::slots_Save
 ///

 void TManager::slots_Save()
 {

     for (int i=0; i < 8; i++)
     {
             m_Serial_ptr->Transaction("<lq_s;"+QString::number(i)+';'+m_SM_ptr->Slot[i].IdName+';'+QString::number(m_SM_ptr->Slot[i].ActualML)+";>");
     }
 };


 void TManager::drink_Save()
 {
 // Tworzy nowy plik schematu lub nadpisuje wprowadzonymi ustawieniami -> <sch_new;baranga;VOD3;22;WHS;53;BRAK;0;BRAK;0;>
  sendToDevice("<sch_new;"+m_Mixer_ptr->getView()->m_Name+";"+
               m_Mixer_ptr->getView()->m_LQ1_Code+";"+QString::number(m_Mixer_ptr->getView()->m_LQ1_amount)+";"+
               m_Mixer_ptr->getView()->m_LQ2_Code+";"+QString::number(m_Mixer_ptr->getView()->m_LQ2_amount) +";"+
               m_Mixer_ptr->getView()->m_LQ3_Code+";"+QString::number(m_Mixer_ptr->getView()->m_LQ3_amount) +";"+
               m_Mixer_ptr->getView()->m_LQ4_Code+";"+QString::number(m_Mixer_ptr->getView()->m_LQ4_amount) +
               ";>",4);

 };



 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /// \brief TManager::newJob
 /// \param requestLine
 /// \return
 ///
bool TManager::newJob(const QString& requestLine){

    *m_ParamPart_ptr << requestLine;


    typedef void (TManager::*ReaPTR)(ParamPart &PP);
    ReaPTR MemberReactionPointer= &TManager::Reaction;
    QString Return = QString::fromStdString(m_ParamPart_ptr->Interpreter(this,MemberReactionPointer));
   // Log(Return);
   return 1;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief TManager::sendToDevice
/// \param cmd
/// \param Interface
///

void TManager::sendToDevice(const QString& cmd, const int& Interface)
{

   m_Serial_ptr->write(cmd+"\t\n",Interface);


}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief TManager::Log
/// \param Line
/// \param Interface
///
void TManager::Log(const QString& Line, const int& Interface){
    QString IFCName="SYSTEM";
    QString Color="yellow";

    switch (Interface) {

    case 0:
    {
        IFCName="SYSTEM";
        Color="yellow";
        break;
    };


    case 1:
    {
        IFCName="SYSTEM ERROR";
        Color="red";
        break;

    };

    case 2:
    {
        IFCName="USER";
        Color="lime";
        break;

    };

    case 3:
    {
        IFCName="DEVICE";
        Color="pink";
        break;

    };

    case 4:
    {
        IFCName="GUI";
        Color="orange";
        break;

    };

};

    if (Line!="")
        emit addLog(Line,IFCName,Color);

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


