#ifndef MIXER_H
#define MIXER_H
#include <QObject>
#include <ctime>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <vector>
#include "tstatustable.h"
#include "TView.h"

class TStatusTable;

class Mixer : public QObject {
    Q_OBJECT
public:
    // Slots from Slotmaster
    const QStringList* IDListPtr;  // Pointer to external list of slots (slotmaster.ActualList)

    // Views functions
    void AddDrinkFromParams(const QString& DrinkName,
                            const QString& AV_LQ1,
                            const int& LQ1_amo,
                            const QString& AV_LQ2,
                            const int& LQ2_amo,
                            const QString& AV_LQ3,
                            const int& LQ3_amo,
                            const QString& AV_LQ4,
                            const int& LQ4_amo,
                            bool Lemon);

    QStringList* GetActualNames();  // Generate list of names in QStringList DrinkList;
    const TView* getView() const { return ActualView; }
    bool isNotEmpty() {
        if (Views.size())
            return 1;
        else
            return 0;
    };  //Check if is any item on drinklist
    int LocalizeSlot(const QString& Code);
    int isOnDrinkList(const QString& NameIn);

public slots:
    QStringList getIDList();
    QStringList getDrinkList();
    QString getStatusTxt() { return StatusTxt; };
    QString getActualName() {
        if (ActualView)
            return ActualView->m_Name;
        else
            return "default";
    };
    void deleteItem(const int& ItemIndex);
    void setActualName(const QString& newName, const int& backIdx = 0) {
        if (ActualView) {
            if (ActualView->m_Name != newName)
                ActualView->m_Name = newName;
        }
        GetActualNames();
        pushDrinkListUpdate(backIdx);
    };
    void DeleteDrink(){};
    void callNewViewUpdate();
    void itemIndexChanged(const int& NewItemIndex = 0);
    void saveChanges(const QString& DrinkName,
                     const int& nidx1,
                     const int& LQ1_amo,
                     const int& nidx2,
                     const int& LQ2_amo,
                     const int& nidx3,
                     const int& LQ3_amo,
                     const int& nidx4,
                     const int& LQ4_amo,
                     bool Lemon);

signals:
    QString pushIDListUpdate();
    QString pushDrinkListUpdate(int idxrtn);
    void pushNewViewUpdate(int AV_LQ1_itemIndex, int LQ1_amo, int AV_LQ2_itemIndex, int LQ2_amo, int AV_LQ3_itemIndex, int LQ3_amo, int AV_LQ4_itemIndex, int LQ4_amo, bool Lemon);

private:
    int m_ItemIndex;            // Synchronization itemIndex
    QString StatusTxt;          //Variable to show status of load data about actual view.
    TStatusTable* m_Table_ptr;  // Pointer to Table (for push drinklist update)

    // Views variables/types
    std::vector<TView> Views;
    TView* ActualView;      // Show choosed item by this pointer (Point to Views item which is TView)
    QStringList DrinkList;  // List of names of drink generated from Views stored in vector.

public:
    explicit Mixer(TStatusTable* STP, QObject* parent = nullptr)
        : m_Table_ptr(STP), QObject(parent), IDListPtr(nullptr)  {
        m_Table_ptr->m_DrinkList_ptr = &DrinkList;
        m_Table_ptr->m_MixerViews_ptr = &Views;  };  //Constructor
};

#endif  // MIXER_H
