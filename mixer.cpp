#include "mixer.h"

Mixer::Mixer(QObject *parent) :
    QObject(parent),IDListPtr(nullptr)
{

//AddDrinkFromParams("robur","VOD1",20,"VOD1",20,"VOD1",20,"VOD1",20);

//AddDrinkFromParams(); // for debugging
//AddDrinkFromParams();// for debugging
//ddDrinkFromParams();// for debugging



}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::AddDrinkFromParams(const QString& DrinkName,
                               const QString& AV_LQ1, const int& LQ1_amo,
                               const QString& AV_LQ2, const int& LQ2_amo,
                               const QString& AV_LQ3, const int& LQ3_amo,
                               const QString& AV_LQ4, const int& LQ4_amo)
{
    TView TmpView(DrinkName,AV_LQ1,LQ1_amo,AV_LQ2,LQ2_amo,AV_LQ3,LQ3_amo,AV_LQ4,LQ4_amo); // Put variables from in values in to this class object)
    Views.insert(Views.end(),TmpView); // and then add to list of objects.
    GetActualNames(); // get only names to NamesList
    pushDrinkListUpdate(0);
    itemIndexChanged(0);
  //  callNewViewUpdate();
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
QStringList* Mixer::GetActualNames() {
    DrinkList.clear();
    for (const TView& ViewM : Views) {
    DrinkList.append(ViewM.m_Name);
    };
  return &DrinkList ;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

QStringList Mixer::getIDList()
{
    if (IDListPtr) return *IDListPtr;

    return {"brak wkaznika listy slotpw"};

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

QStringList Mixer::getDrinkList()
{
     return DrinkList;

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::itemIndexChanged(const int& NewItemIndex)
{
    if (isNotEmpty()) {
m_ItemIndex=NewItemIndex;
ActualView = &Views[m_ItemIndex];
GetActualNames();
callNewViewUpdate();
    };
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Mixer::callNewViewUpdate() {
    if (isNotEmpty()) {
   StatusTxt.clear();
   int
           idx1=LocalizeSlot(ActualView->m_LQ1_Code),
           idx2=LocalizeSlot(ActualView->m_LQ2_Code),
           idx3=LocalizeSlot(ActualView->m_LQ3_Code),
           idx4=LocalizeSlot(ActualView->m_LQ4_Code);

   StatusTxt+=" 1: ";
   if (idx1<9) StatusTxt+="OK, ";  else  StatusTxt+=ActualView->m_LQ1_Code+" - NOT FOUND, ";
   StatusTxt+=" 2: ";
   if (idx2<9) StatusTxt+="OK, ";  else  StatusTxt+=ActualView->m_LQ2_Code+" - NOT FOUND, ";
   StatusTxt+=" 3: ";
   if (idx3<9) StatusTxt+="OK, ";  else  StatusTxt+=ActualView->m_LQ3_Code+" - NOT FOUND, ";
   StatusTxt+=" 4: ";
   if (idx4<9) StatusTxt+="OK ";  else  StatusTxt+=ActualView->m_LQ4_Code+" - NOT FOUND ";

    pushNewViewUpdate(idx1,ActualView->m_LQ1_amount,idx2,ActualView->m_LQ2_amount,idx3,ActualView->m_LQ3_amount,idx4,ActualView->m_LQ4_amount);
};
    };
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int Mixer::LocalizeSlot(const QString& Code)
{
    for (int i=0; i < IDListPtr->count();i++)
    {
        if (IDListPtr->at(i)==Code) return i; // If found return itemIndex of Slot

    }
    return 9; // If not found return itemIndex of none slot

}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
