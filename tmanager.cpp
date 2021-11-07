#include "serialx.h"
#include "slotmaster.h"
#include "tmanager.h"
#include "tstatustable.h"
#include <thread>


void TManager::glass_Save(bool Force)
{
    makeQue();
    for (int i=0; i < 4; i++)
    {
           QString Version = (!Force)?"":"2";
           m_Serial_ptr->Transaction("<n_set"+Version+";"+QString::number(i)+';'+QString::number(m_Table_ptr->Glass[i].MaxCap)+';'+QString::number(m_Table_ptr->Glass[i].Locked)+';'+m_Table_ptr->Glass[i].DrinkScheme+";>");

   }
     if (Force) {m_Serial_ptr->Transaction("<l_br;>"); sett_ForceSave();};

};

void TManager::sett_ForceSave()
{
m_Serial_ptr->Transaction("<sett_s;>");


                        }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// \brief TManager::executeDisp
///
///
///
///
void TManager::makeQue()
{
    QString tmpString;
    for (auto &oneShot : m_Table_ptr->Glass)
    { tmpString+=QString::number(oneShot.Checked)+';'; }
    m_Serial_ptr->Transaction("<n_que;"+tmpString+'>');

};

 void TManager::executeDisp()
 {
      std::thread t1(&SerialX::startBusy,std::ref(m_Serial_ptr));
      player->setMedia(QUrl::fromLocalFile("/home/piotr/LQArmGUIv3/static/wavs/disp.wav"));
      player->setVolume(30); player->play();
     // m_Serial_ptr->startBusy();


     glass_Save();

     m_Serial_ptr->Transaction("<srv_nalall;>");

     t1.join();

 };


 void TManager::escape()
 {
   //   m_Serial_ptr->startBusy();

     m_Serial_ptr->Transaction("<srv_esc;>");

    // m_Serial_ptr->stopBusy();
 };

 void TManager::home()
 {
    //  m_Serial_ptr->startBusy();
     m_Serial_ptr->Transaction("<srv_home;>");

    // m_Serial_ptr->stopBusy();
 };

 void TManager::sink()
 {
    //  m_Serial_ptr->startBusy();

     m_Serial_ptr->Transaction("<srv_dok;>");

 //    m_Serial_ptr->stopBusy();
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
               m_Mixer_ptr->getView()->m_LQ4_Code+";"+QString::number(m_Mixer_ptr->getView()->m_LQ4_amount) +";"+
               QString::number(m_Mixer_ptr->getView()->isLemon)+
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


