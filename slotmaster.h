#ifndef SLOTMASTER_H
#define SLOTMASTER_H

#include <QObject>

class SlotMaster : public QObject
{
    Q_OBJECT
public:
    explicit SlotMaster(QObject *parent = nullptr);

signals:

};

#endif // SLOTMASTER_H
