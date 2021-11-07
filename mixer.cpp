#include "mixer.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::AddDrinkFromParams(const QString& DrinkName,
                               const QString& AV_LQ1,
                               const int& LQ1_amo,
                               const QString& AV_LQ2,
                               const int& LQ2_amo,
                               const QString& AV_LQ3,
                               const int& LQ3_amo,
                               const QString& AV_LQ4,
                               const int& LQ4_amo,
                               bool Lemon) {
    if (!isOnDrinkList(DrinkName)) {
        TView TmpView(DrinkName, AV_LQ1, LQ1_amo, AV_LQ2, LQ2_amo, AV_LQ3, LQ3_amo, AV_LQ4, LQ4_amo, Lemon);  // Put variables from in values in to this class object)
        Views.insert(Views.end(), TmpView);                                                                   // and then add to list of objects.
        GetActualNames();                                                                                     // get only names to NamesList
        pushDrinkListUpdate(0);
        itemIndexChanged();
    };
    //  callNewViewUpdate();
}

void Mixer::saveChanges(const QString& DrinkName,
                        const int& nidx1,
                        const int& LQ1_amo,
                        const int& nidx2,
                        const int& LQ2_amo,
                        const int& nidx3,
                        const int& LQ3_amo,
                        const int& nidx4,
                        const int& LQ4_amo,
                        bool Lemon) {
    if (ActualView != nullptr) {
        ActualView->m_Name = DrinkName,
        ActualView->m_LQ1_Code = IDListPtr->at(nidx1);
        ActualView->m_LQ1_amount = LQ1_amo;
        ActualView->m_LQ2_Code = IDListPtr->at(nidx2);
        ActualView->m_LQ2_amount = LQ2_amo,
        ActualView->m_LQ3_Code = IDListPtr->at(nidx3);
        ActualView->m_LQ3_amount = LQ3_amo;
        ActualView->m_LQ4_Code = IDListPtr->at(nidx4);
        ActualView->m_LQ4_amount = LQ4_amo;
        ActualView->isLemon = Lemon;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

QStringList Mixer::getIDList() {
    if (IDListPtr)
        return *IDListPtr;

    return {"brak wkaznika listy slotpw"};
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

QStringList Mixer::getDrinkList() {
    return DrinkList;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

QStringList* Mixer::GetActualNames() {
    DrinkList.clear();

    for (const TView& ViewM : Views) {
        DrinkList.append(ViewM.m_Name);
    };
    m_Table_ptr->pushSchemesUpdate();

    return &DrinkList;
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::itemIndexChanged(const int& NewItemIndex) {
    if (isNotEmpty()) {
        m_ItemIndex = NewItemIndex;
        ActualView = &Views[m_ItemIndex];
        GetActualNames();
        callNewViewUpdate();
    };
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Mixer::deleteItem(const int& ItemIndex)  // not tested!
{
    if (ItemIndex != 0) {
        ActualView = nullptr;
        Views.erase(Views.begin() + ItemIndex);
        itemIndexChanged(Views.size() - 1);
        pushDrinkListUpdate(Views.size() - 1);
    };
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Mixer::callNewViewUpdate() {
    if (isNotEmpty()) {
        StatusTxt.clear();
        int
            idx1 = LocalizeSlot(ActualView->m_LQ1_Code),
            idx2 = LocalizeSlot(ActualView->m_LQ2_Code),
            idx3 = LocalizeSlot(ActualView->m_LQ3_Code),
            idx4 = LocalizeSlot(ActualView->m_LQ4_Code);

        StatusTxt += " 1: ";
        if (idx1 < 8)
            StatusTxt += ActualView->m_LQ1_Code + " - OK,  \n";
        else
            StatusTxt += ActualView->m_LQ1_Code + " - Nie znaleziono!, \n";
        StatusTxt += " 2: ";
        if (idx2 < 8)
            StatusTxt += ActualView->m_LQ2_Code + " - OK, \n";
        else
            StatusTxt += ActualView->m_LQ2_Code + " - Nie znaleziono!, \n";
        StatusTxt += " 3: ";
        if (idx3 < 8)
            StatusTxt += ActualView->m_LQ3_Code + " - OK, \n";
        else
            StatusTxt += ActualView->m_LQ3_Code + " - Nie znaleziono!, \n";
        StatusTxt += " 4: ";
        if (idx4 < 8)
            StatusTxt += ActualView->m_LQ4_Code + " - OK \n";
        else
            StatusTxt += ActualView->m_LQ4_Code + " - Nie znaleziono! \n";

        pushNewViewUpdate(idx1, ActualView->m_LQ1_amount, idx2, ActualView->m_LQ2_amount, idx3, ActualView->m_LQ3_amount, idx4, ActualView->m_LQ4_amount, ActualView->isLemon);
    };
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int Mixer::LocalizeSlot(const QString& Code) {
    for (int i = 0; i < IDListPtr->count(); i++) {
        if (IDListPtr->at(i) == Code)
            return i;  // If found return itemIndex of Slot
    }
    return 8;  // If not found return itemIndex of none slot
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int Mixer::isOnDrinkList(const QString& NameIn) {
    for (auto Dname : DrinkList) {
        if (Dname == NameIn)
            return 1;  //
    }
    return 0;  // If not found return itemIndex of none slot
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
