#ifndef MIXER_H
#define MIXER_H
#include <QObject>
#include <ctime>
#include <iomanip>
#include <sstream>
#include <iostream>
#include <vector>


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
          QString LQ3_Code="WOD1", int LQ3_amount=40,
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
    void AddDrinkFromParams();
    QStringList* GetActualNames();
    const TView* getView() {return ActualView;}



public slots:
    QStringList getIDList();
    QStringList getDrinkList();
    void callNewViewUpdate() {pushNewViewUpdate(0,75,2,30,4,70,7,100);};
    void itemIndexChanged(const int& NewItemIndex=0);



signals:
    QString pushIDListUpdate();
    QString pushDrinkListUpdate(int idxrtn);
    void pushNewViewUpdate(int AV_LQ1_itemIndex, int LQ1_amo,
                           int AV_LQ2_itemIndex, int LQ2_amo,
                           int AV_LQ3_itemIndex, int LQ3_amo,
                           int AV_LQ4_itemIndex, int LQ4_amo);



private:
    int m_ItemIndex; // Synchronization itemIndex

    // Views variables/types
    std::vector<TView> Views;
    TView * ActualView; // Show choosed item by this pointer (Point to Views item which is TView)
    QStringList DrinkList; // List of names of drink generated from Views stored in vector.



public:
    explicit Mixer(QObject *parent = nullptr);  //Constructor

};

#endif // MIXER_H
