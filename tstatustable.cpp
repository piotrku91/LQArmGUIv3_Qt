#include "tstatustable.h"

TStatusTable::TStatusTable(QObject *parent) : QObject(parent)
{


}

void TStatusTable::setActiveState(const int& idx) {

    if (Glass[idx].Checked) { Glass[idx].Checked=false; }
    else
    Glass[idx].Checked=true;

     pushStatesUpdate();

}

void TStatusTable::setActiveStateALL(const bool&  newstate) {

    for (auto &oneGlass : Glass)
    {
       oneGlass.Checked=newstate;

    };
 pushStatesUpdate();
}

void TStatusTable::setLockFlag(const int& idx, const bool&  newlockflag) {

    Glass[idx].Locked=newlockflag;
    pushImagesUpdate();

};

void TStatusTable::setLockForActive(const bool&  newlockflag) {

    for (auto &oneGlass : Glass)
    {
        if (oneGlass.Checked) oneGlass.Locked=newlockflag;

    };
    pushImagesUpdate();
};


bool TStatusTable::getLockFlag(const int& idx) {
    return Glass[idx].Locked;

};

bool   TStatusTable::getActiveState(const int& idx) {
    return Glass[idx].Checked;

};
