#include "serialx.h"
#include "tmanager.h"

void TManager::Reaction(ParamPart &P)
{
Log("jestem");
    if (P.Header("artn")) {
     Log("przyszłooooooooooooooooooooooo");


    };



}


bool TManager::newJob(const QString& requestLine){

    *m_ParamPart_ptr << requestLine;


    typedef void (TManager::*ReaPTR)(ParamPart &PP);
    ReaPTR MemberReactionPointer= &TManager::Reaction;

    m_ParamPart_ptr->Interpreter(this,MemberReactionPointer);

   return 1;
}

void TManager::Log(const QString& Line, const int& Interface){
    QString IFCName="SYSTEM";
    QString Color="red";

    switch (Interface) {

    case 0:
    {
        IFCName="SYTEM";
        Color="yellow";
        break;
    };


    case 1:
    {
        IFCName="GUI";
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

};
        emit addLog(Line,IFCName,Color);

};


