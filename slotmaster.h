#ifndef SLOTMASTER_H
#define SLOTMASTER_H

#include <QObject>

struct TSlot
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

public:
    explicit SlotMaster(QObject *parent = nullptr);
    TSlot Slot[9];
    void ImportFromParams(const int& Index, const QString& IDName, const int& ActualML, const int& MaxML);
    void ExportToParams(const int& Index, QString& IDName, int& ActualML, int& MaxML);

public slots:
    QString getIDName(const int& idx) {return Slot[idx].IdName;};
    int getMaxML(const int& idx) {return Slot[idx].MaxML;};
    int getActualML(const int& idx) {return Slot[idx].ActualML;};

    void setIDName(const int& idx, const QString& NewName) {Slot[idx].IdName=NewName.toUpper();};
    void setMaxML(const int& idx, const int& NewMaxML) {Slot[idx].MaxML=NewMaxML;};
    void setActualML(const int& idx, const int& NewActualML) {Slot[idx].ActualML=NewActualML;};

signals:
    QString pushUpdate();

};

#endif // SLOTMASTER_H
