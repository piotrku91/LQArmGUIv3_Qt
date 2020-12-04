#include "serialx.h"
#include "slotmaster.h"
#include "tmanager.h"
#include "tstatustable.h"

void TManager::Reaction(ParamPart &P)
{
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                         /// REACTIONS TO MESSAGES FROM ARDUINO ///

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if (P.Header("boot_ok"))
    {
      slots_Load();
      unlockApp();
      P.ReadDone(true);
    };

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if ((P.Header("lq_i")) && P.Integrity(4,NUMBER,STRING,NUMBER,NUMBER))
    {
      m_SM_ptr->ImportFromParams(P[0].toInt(),P[1],P[2].toInt(),P[3].toInt());
//Log(P[2]);
        P.ReadDone(true);
    };


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        if ((P.Header("n_i")) && P.Integrity(4,NUMBER,NUMBER,NUMBER,STRING))
        {
          m_Table_ptr->ImportFromParams(P[0].toInt(),P[1].toInt(),P[2].toInt(),P[3]);

            P.ReadDone(true);
        };

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if (P.Header("drn"))
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


