#include "serialx.h"
#include "slotmaster.h"
#include "tmanager.h"

void TManager::Reaction(ParamPart &P)
{
  //  Log(P[1]);

    if (P.Header("artn")) { // Line from Arduino return
// -----------------------------------------------------------------------------------------

// #########################################################################################

        if (P.UseAsHeader("cmp"))
        {
          m_SM_ptr->ImportFromParams(P[1].toInt(),P[0],0,0);
            Log("jestem");
            P.ReadDone(false); //Mark as Read but nothing to return
        };

// #########################################################################################





// -----------------------------------------------------------------------------------------
    }; // artn header end
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
bool TManager::newJob(const QString& requestLine){

    *m_ParamPart_ptr << requestLine;


    typedef void (TManager::*ReaPTR)(ParamPart &PP);
    ReaPTR MemberReactionPointer= &TManager::Reaction;
    QString Return = QString::fromStdString(m_ParamPart_ptr->Interpreter(this,MemberReactionPointer));

   return 1;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
        Color="lime";
        break;

    };

};
        emit addLog(Line,IFCName,Color);

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


