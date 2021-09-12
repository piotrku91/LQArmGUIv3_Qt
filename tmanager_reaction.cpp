#include "serialx.h"
#include "slotmaster.h"
#include "tmanager.h"
#include "tstatustable.h"

void TManager::Reaction(ParamPart &P)
{
    static bool Booting=true;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                         /// REACTIONS TO MESSAGES FROM ARDUINO ///

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    if (P.Header("boot_ok"))
    {
        m_Serial_ptr->jobStart("BOOTOWANIE");
      slots_Load();
   //   unlockApp();
      P.ReadDone(true);
    };

    if (P.Header("boot2_ok"))
    {
      drink_Load();
   //   unlockApp();
      P.ReadDone(true);
    };

    if (P.Header("boot3_ok"))
    {
      glass_Load();
   //   unlockApp();
      m_Serial_ptr->jobFinish();
      P.ReadDone(true);
    };


    if (P.Header("tsyn"))
    {
      QString Year, Month, Day, DoW, Hour, Min, Sec;
      m_clocky_ptr->getTimeDateSplitted(Year, Month, Day, DoW, Hour, Min, Sec);
      int SecTmp=Sec.toInt();

       SecTmp+=2; // Minimize error of Serial delay .

      if (SecTmp>59) SecTmp-=60;
      sendToDevice("<t_set;"+Year+';'+ Month+';'+ Day+';'+ DoW+';'+Hour+';'+ Min+';'+QString::number(SecTmp)+";>",4);

      P.ReadDone(true);
    };

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        if ((P.Header("v")))
        {
            m_Table_ptr->presentVersion(P[0].toFloat());
            P.ReadDone(false);
        };

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if ((P.Header("lq_i")) && P.Integrity(4,NUMBER,STRING,NUMBER,NUMBER))
    {
      m_SM_ptr->ImportFromParams(P[0].toInt(),P[1],P[2].toInt(),1500,P[3].toInt());
//Log(P[2]);
        P.ReadDone(true);
    };


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        if ((P.Header("n_i")) && P.Integrity(4,NUMBER,NUMBER,NUMBER,STRING))
        {
          m_Table_ptr->ImportFromParams(P[0].toInt(),P[1].toInt(),P[2].toInt(),P[3]);
       //    Log("ej");
            P.ReadDone(true);
        };

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if (P.Header("sch_i"))
    {
     m_Mixer_ptr->AddDrinkFromParams(P[0],P[1],P[2].toInt(),P[3],P[4].toInt(),P[5],P[6].toInt(),P[7],P[8].toInt());
//Log(P[2]);
        P.ReadDone(true);
    };

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                     /// CONFIRMATION RETURN MESSAGES FROM ARDUINO ///

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (P.Header("artn")) {
/// -----------------------------------------------------------------------------------------

/// #########################################################################################

        if (P.UseAsHeader("cmp"))
        {
            Log("jestem");
            P.ReadDone(false); //Mark as Read but nothing to return
        };

        if (P.UseAsHeader("srv_nalall"))
        {
            m_Serial_ptr->stopBusy();
            m_Serial_ptr->jobFinish();
            P.ReadDone(false); //Mark as Read but nothing to return
        };

        if (P.UseAsHeader("srv_home") || P.UseAsHeader("srv_esc"))
        {
            m_SM_ptr->dockPositionLeft();
            m_Serial_ptr->jobFinish();

        };

        if (P.UseAsHeader("srv_dok"))
        {
            m_SM_ptr->dockPosition();
            m_Serial_ptr->jobFinish();

        };

        if (P.UseAsHeader("db"))
        {
            Log("** Ustawienia slotów wczytane pomyślnie");
            P.ReadDone(false); //Mark as Read but nothing to return
        };

/// #########################################################################################



    }; /// artn header end
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


