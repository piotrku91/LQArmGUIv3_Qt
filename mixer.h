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
    // Views
    TView * ActualView; // Show choosed item by this pointer (Point to Views item which is TView)
    std::vector<TView>* ViewsPtr; // Views
    QStringList NamesList; // List of names of drink generated from Views stored in vector.

    void AddDrinkFromParams();
    QStringList* GetActualNames();

    // Slots from Slotmaster
    const QStringList *IDListPtr; // Pointer to external list of slots (slotmaster.ActualList)




public slots:
    QStringList getIDList();
    QStringList& getDrinkList();

signals:
    void itemIndexChanged();
    QString pushUpdate();


private:


public:
    explicit Mixer(QObject *parent = nullptr);  //Constructor

};

#endif // MIXER_H
