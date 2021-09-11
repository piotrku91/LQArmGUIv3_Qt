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
    bool Ready;
public:
    TSlot():IdName("BRAK"),MaxML(1500),ActualML(750), Ready(false) {};
};

class SlotMaster : public QObject

{
    Q_OBJECT
private:

    Mixer* m_Mixer_ptr; // Pointer to Mixer object (for push slots list update)
    QStringList ActualIDs;

public:
    TSlot Slot[8]; //Slots array
    // Constructor
    explicit SlotMaster(Mixer *Mixer, QObject *parent = nullptr): QObject(parent),m_Mixer_ptr(Mixer)
    {GetActualIDs(); m_Mixer_ptr->IDListPtr=&ActualIDs; m_Mixer_ptr->pushIDListUpdate();};


    void ImportFromParams(const int& Index, const QString& IDName, const int& ActualML, const int& MaxML, const bool& Ready );
    void ExportToParams(const int& Index, QString& IDName, int& ActualML, int& MaxML, const bool& Ready) ;
    QStringList* GetActualIDs();


public slots:
    //Get functions
    QString getIDName(const int& idx);
    int getMaxML(const int& idx);
    int getActualML(const int& idx);
    bool getReady(const int& idx);

    //Set functions
    void setIDName(const int& idx, const QString& NewName);
    void setMaxML(const int& idx, const int& NewMaxML);
    void setActualML(const int& idx, const int& NewActualML);
    void setReady(const int& idx, bool NewState);

signals:
    QString pushUpdate();

};

#endif // SLOTMASTER_H
