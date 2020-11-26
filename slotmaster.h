#ifndef SLOTMASTER_H
#define SLOTMASTER_H

#include <QObject>
#include <mixer.h>

class TSlot
{
public:
    QString IdName;
    int MaxML;
    int ActualML;
public:
    TSlot():IdName("BRAK"),MaxML(1500),ActualML(750) {};
};

class SlotMaster : public QObject
{
    Q_OBJECT
private:
    TSlot Slot[9];
    Mixer* m_Mixer_ptr;
    QStringList ActualIDs;
    friend class Mixer;

public:
    // Constructor
    explicit SlotMaster(Mixer *Mixer, QObject *parent = nullptr): QObject(parent),m_Mixer_ptr(Mixer)
    {GetActualIDs(); m_Mixer_ptr->IDListPtr=&ActualIDs; m_Mixer_ptr->pushIDListUpdate();};


    void ImportFromParams(const int& Index, const QString& IDName, const int& ActualML, const int& MaxML);
    void ExportToParams(const int& Index, QString& IDName, int& ActualML, int& MaxML) ;
    QStringList* GetActualIDs();


public slots:
    //Get functions
    QString getIDName(const int& idx);
    int getMaxML(const int& idx);
    int getActualML(const int& idx);
    //Set functions
    void setIDName(const int& idx, const QString& NewName);
    void setMaxML(const int& idx, const int& NewMaxML);
    void setActualML(const int& idx, const int& NewActualML);

signals:
    QString pushUpdate();

};

#endif // SLOTMASTER_H
