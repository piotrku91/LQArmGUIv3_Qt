#ifndef SLOTMASTER_H
#define SLOTMASTER_H

#include <QObject>

class SlotMaster : public QObject
{
    Q_OBJECT

public:
    explicit SlotMaster(QObject *parent = nullptr);

    struct TSlot
    {
    private:
        QString IdName;
        int MaxML;
        int ActualML;

public:
        TSlot():IdName("BRAK"),MaxML(0),ActualML(0) {};
    };

TSlot Slot[9];

signals:

};

#endif // SLOTMASTER_H
