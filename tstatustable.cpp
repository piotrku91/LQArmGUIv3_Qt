#include "tstatustable.h"


TStatusTable::TStatusTable(QObject *parent) : QObject(parent)
{


}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::ImportFromParams(const int& Index, const bool& LockState, const int& MaxCap, const QString& SchemeName)
{

    setLockFlag(Index,LockState);
    setMaxCap(Index,MaxCap);
   setSchemeByIDX(Index,LocalizeDrink(SchemeName));

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::setMaxCap(const int& idx,const int& capacity) {

    Glass[idx].MaxCap=capacity;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int TStatusTable::LocalizeDrink(const QString& SchemeName) {

    for (int i=0; i < m_DrinkList_ptr->count();i++)
    {
        if (m_DrinkList_ptr->at(i)==SchemeName) return i;

    }
    return 0;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::setSchemeByIDX(const int& idx, const int& comboidx) {
    Glass[idx].DrinkScheme=m_DrinkList_ptr->at(comboidx);
    pushSchemesUpdate();
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::setActiveState(const int& idx) {

    if (Glass[idx].Checked) { Glass[idx].Checked=false; }
    else
    Glass[idx].Checked=true;

     pushStatesUpdate();

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::setActiveStateALL(const bool&  newstate) {

    for (auto &oneGlass : Glass)
    {
       oneGlass.Checked=newstate;

    };
 pushStatesUpdate();
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::setLockFlag(const int& idx, const bool&  newlockflag) {

    Glass[idx].Locked=newlockflag;
    pushImagesUpdate();

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void TStatusTable::setLockForActive(const bool&  newlockflag) {

    for (auto &oneGlass : Glass)
    {
        if (oneGlass.Checked) oneGlass.Locked=newlockflag;

    };
    pushImagesUpdate();
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


bool TStatusTable::getLockFlag(const int& idx) {
    return Glass[idx].Locked;

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
bool TStatusTable::getLemonToThrow(const int& idx) {
    return  m_MixerViews_ptr->at(LocalizeDrink(Glass[idx].DrinkScheme)).isLemon;
};



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

bool   TStatusTable::getActiveState(const int& idx) {
    return Glass[idx].Checked;

};


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
