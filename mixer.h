#ifndef MIXER_H
#define MIXER_H
#include <QObject>
#include <ctime>
#include <iomanip>
#include <sstream>
#include <iostream>
#include <vector>
#include "tstatustable.h"


class TStatusTable;

class TView
{
public:
    QString  m_Name;
    QString m_LQ1_Code;
    int m_LQ1_amount;
    QString m_LQ2_Code;
    int m_LQ2_amount;
    QString m_LQ3_Code;
    int m_LQ3_amount;
    QString m_LQ4_Code;
    int m_LQ4_amount;

public:
    // Constructor
    TView(QString Name="domyslny",
          QString LQ1_Code="VOD1",int LQ1_amount=500,
          QString LQ2_Code="WHS1", int LQ2_amount=599,
          QString LQ3_Code="WO1", int LQ3_amount=40,
          QString LQ4_Code="BRAK", int LQ4_amount=0)
        : m_Name(Name),
          m_LQ1_Code(LQ1_Code), m_LQ1_amount(LQ1_amount),
          m_LQ2_Code(LQ2_Code), m_LQ2_amount(LQ2_amount),
          m_LQ3_Code(LQ3_Code),m_LQ3_amount(LQ3_amount),
          m_LQ4_Code(LQ4_Code),m_LQ4_amount(LQ4_amount)
    {};

};


class Mixer: public QObject
{
    Q_OBJECT
public:
    // Slots from Slotmaster
    const QStringList *IDListPtr; // Pointer to external list of slots (slotmaster.ActualList)


    // Views functions
    void AddDrinkFromParams(const QString& DrinkName,
                            const QString& AV_LQ1, const int& LQ1_amo,
                            const QString& AV_LQ2, const int& LQ2_amo,
                            const QString& AV_LQ3, const int& LQ3_amo,
                            const QString& AV_LQ4, const int& LQ4_amo);


    QStringList* GetActualNames(); // Generate list of names in QStringList DrinkList;
    const TView* getView() const {return ActualView;}
    bool isNotEmpty() {if (Views.size()) return 1; else return 0;} ; //Check if is any item on drinklist
    int LocalizeSlot(const QString& Code);
    int isOnDrinkList(const QString& NameIn);



public slots:
    QStringList getIDList();
    QStringList getDrinkList();
    QString getStatusTxt() {return StatusTxt;};
    void callNewViewUpdate();
    void itemIndexChanged(const int& NewItemIndex=0);
    void saveChanges(const QString& DrinkName,
                                   const int& nidx1, const int& LQ1_amo,
                                   const int& nidx2, const int& LQ2_amo,
                                   const int& nidx3, const int& LQ3_amo,
                                   const int& nidx4, const int& LQ4_amo);


signals:
    QString pushIDListUpdate();
    QString pushDrinkListUpdate(int idxrtn);
    void pushNewViewUpdate(int AV_LQ1_itemIndex, int LQ1_amo,
                           int AV_LQ2_itemIndex, int LQ2_amo,
                           int AV_LQ3_itemIndex, int LQ3_amo,
                           int AV_LQ4_itemIndex, int LQ4_amo);



private:
    int m_ItemIndex; // Synchronization itemIndex
    QString StatusTxt; //Variable to show status of load data about actual view.
    TStatusTable *m_Table_ptr; // Pointer to Table (for push drinklist update)

    // Views variables/types
    std::vector<TView> Views;
    TView * ActualView; // Show choosed item by this pointer (Point to Views item which is TView)
    QStringList DrinkList; // List of names of drink generated from Views stored in vector.


public:
    explicit Mixer(TStatusTable *STP, QObject *parent = nullptr):IDListPtr(nullptr),m_Table_ptr(STP),QObject(parent) {m_Table_ptr->m_DrinkList_ptr=&DrinkList;};//Constructor

};

#endif // MIXER_H
