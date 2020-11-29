#ifndef TSTATUSTABLE_H
#define TSTATUSTABLE_H

#include <QObject>


class TGlassInfo
{
public:
    int MaxCap;
    bool Locked;
    QString DrinkScheme;

    bool Checked;

    TGlassInfo():MaxCap(50),Locked(false),DrinkScheme("default"),Checked(false) {}


};

class TStatusTable : public QObject
{
    Q_OBJECT
public:
    explicit TStatusTable(QObject *parent = nullptr);

public:
    QStringList *m_DrinkList_ptr;
    TGlassInfo Glass[5];

    void ImportFromParams();
    void DrinkSchemeChanged();

public slots:
    void setActiveState(const int& idx);
    void setActiveStateALL(const bool&  newstate);
    void setLockFlag(const int& idx, const bool&  newlockflag);
    void setLockForActive(const bool&  newlockflag);
    bool  getLockFlag(const int& idx);;
    bool getActiveState(const int& idx);







signals:
    void pushSchemesUpdate();
    void pushImagesUpdate();
    void pushStatesUpdate();
};

#endif // TSTATUSTABLE_H
