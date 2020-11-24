#include "slotmaster.h"

SlotMaster::SlotMaster(QObject *parent) : QObject(parent)
{

}


void SlotMaster::ImportFromParams(const int& Index, const QString& IDName, const int& ActualML, const int& MaxML)
{
    setIDName(Index,IDName);
    setActualML(Index,ActualML);
    setMaxML(Index,MaxML);
    emit pushUpdate();

};

void SlotMaster::ExportToParams(const int& Index, QString& IDName, int& ActualML, int& MaxML)
{
    IDName=getIDName(Index);
    ActualML=getActualML(Index);
    MaxML=getMaxML(Index);


};
