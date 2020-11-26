#include "mixer.h"

Mixer::Mixer(QObject *parent) :
    QObject(parent),IDListPtr(nullptr)
{



AddDrinkFromParams(); // for debugging
AddDrinkFromParams();// for debugging
AddDrinkFromParams();// for debugging



}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::AddDrinkFromParams()
{
    TView TmpView; // Put variables from in values in to this class object
    Views.insert(Views.end(),TmpView); // and then add to list of objects.
    GetActualNames(); // get only names to NamesList

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

QStringList Mixer::getDrinkList()
{
     return DrinkList;

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::itemIndexChanged(const int& NewItemIndex)
{
m_ItemIndex=NewItemIndex;
ActualView = &Views[m_ItemIndex];
GetActualNames();
callNewViewUpdate();
};

