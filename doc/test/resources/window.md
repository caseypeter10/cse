# WINDOW

WINDOW defines a subobject belonging to the current SURFACE that represents one or more identical windows. The azimuth, tilt, and exterior conditions of the window are the same as those of the surface to which it belongs. The total window area (*wnHt* $\cdot$ *wnWid* $\cdot$ *wnMult*) is deducted from the gross surface area. A surface may have any number of windows.

Windows may optionally have operable interior shading that reduces the overall shading coefficient when closed.

**wnName**

Name of window: follows the word "WINDOW" if given.

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
              *63 characters*   *none*        No             constant

**wnHeight=*float***

Overall height of window (including frame).

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
  ft          *x* $>$ 0         *none*        Yes            constant

wnWidth=*float*Overall width of window (including frame).

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
  ft          *x* $>$ 0         *none*        Yes            constant

**wnArea=*float***

Overall area of window (including frame).

  **Units**   **Legal Range**   **Default**               **Required**   **Variability**
  ----------- ----------------- ------------------------- -------------- -----------------
  ft^2^       *x* $>$ 0         *wnHeight* \* *wnWidth*   No             constant

**wnMult=*float***

Area multiplier; can be used to represent multiple identical windows.

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
              *x* $>$ 0         1             No             constant

**wnModel=*choice***

Selects window model

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
              SHGC, ASHWAT      SHGC          No             constant

wnGt=*choice*

GLAZETYPE for window. Provides many defaults for window properties as cited below.

**wnU=*float***

Window conductance (U-factor without surface films, therefore not actually a U-factor but a C-factor).

Preferred Approach: To use accurately with standard winter rated U-factor from ASHRAE or NFRC enter as:

        wnU = (1/((1/U-factor)-0.85)

Where 0.85 is the sum of the interior (0.68) and exterior (0.17) design air film resistances assumed for rating window U-factors. Enter wnInH (usually 1.5=1/0.68) instead of letting it default. Enter the wnExH or let it default. It is important to use this approach if the input includes gnFrad for any gain term. Using approach 2 below will result in an inappropriate internal gain split at the window.

Approach 2. Enter wnU=U-factor and let the wnInH and wnExH default. Tnormally this approach systematically underestimates the window U-factor because it adds the wnExfilm resistance to 1/U-factor thereby double counting the exterior film resistance. This approach will also yield incorrect results for gnFrad internal gain since the high wnInH will put almost all the gain back in the space.

  **Units**         **Legal Range**   **Default**   **Required**   **Variability**
  ----------------- ----------------- ------------- -------------- -----------------
  Btuh/ft^2^-^o^F   *x* $>$ 0         *none*        Yes            constant

**wnUNFRC=*float***

Fenestration system (including frame) U-factor evaluated at NFRC heating conditions.

  **Units**         **Legal Range**   **Default**   **Required**                       **Variability**
  ----------------- ----------------- ------------- ---------------------------------- -----------------
  Btuh/ft^2^-^o^F   *x* $>$ 0         gtUNFRC       Required when *wnModel* = ASHWAT   constant

**wnInH=*float***

Window interior surface (air film) conductance.

Preferred Approach: Enter the appropriate value for each window, normally:

        wnInH = 1.5

        where 1.5 = 1/0.68 the standard ASHRAE value.

The large default value of 10,000 represents a near-0 resistance, for the convenience of those who wish to include the interior surface film in wnU according to approach 2 above.

  **Units**         **Legal Range**   **Default**                             **Required**   **Variability**
  ----------------- ----------------- --------------------------------------- -------------- -----------------
  Btuh/ft^2^-^o^F   *x* $>$ 0         <!-- same as owning surface --> 10000   No             constant

**wnExH=*float***

Window exterior surface (air film) conductance.

  **Units**         **Legal Range**   **Default**              **Required**   **Variability**
  ----------------- ----------------- ------------------------ -------------- -----------------
  Btuh/ft^2^-^o^F   *x* $>$ 0         same as owning surface   No             constant

**wnSMSO=*float***

SHGC multiplier with shades open. Overrides gtSMSO.

  **Units**   **Legal Range**         **Default**   **Required**   **Variability**
  ----------- ----------------------- ------------- -------------- ------------------
  fraction    0 $\leq$ *x* $\leq$ 1   gtSMSO or 1   No             Monthly - Hourly

**wnSMSC=*float***

SHGC multiplier with shades closed. Overrides gtSMSC

  **Units**   **Legal Range**         **Default**        **Required**   **Variability**
  ----------- ----------------------- ------------------ -------------- ------------------
  fraction    0 $\leq$ *x* $\leq$ 1   wnSMSO or gtSMSC   No             Monthly - Hourly

**wnNGlz=*int***

Number of glazings in the window (bare glass only, not including any interior or exterior shades).

  **Units**   **Legal Range**      **Default**   **Required**                       **Variability**
  ----------- -------------------- ------------- ---------------------------------- -----------------
              0 $<$ *x* $\leq$ 4   gtNGLZ        Required when *wnModel* = ASHWAT   Constant

**wnExShd=*choice***

Exterior shading type (ASHWAT only).

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
              NONE, INSCRN      gtExShd       no             Constant

**wnInShd=*choice***

Interior shade type (ASHWAT only).

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
              NONE, DRAPEMED    gtInShd       no             Constant

**wnDirtLoss=*float***

Glazing dirt loss factor.

  **Units**   **Legal Range**         **Default**   **Required**   **Variability**
  ----------- ----------------------- ------------- -------------- -----------------
  fraction    0 $\leq$ *x* $\leq$ 1   0             no             Constant

**wnGrndRefl=*float***

Ground reflectivity for this window.

  **Units**   **Legal Range**         **Default**   **Required**   **Variability**
  ----------- ----------------------- ------------- -------------- ------------------
  fraction    0 $\leq$ *x* $\leq$ 1   sfGrndRefl    No             Monthly - Hourly

**wnVfSkyDf=*float***

View factor from this window to sky for diffuse radiation. For the shading effects of an overhang, a wnVfSkyDf value smaller than the default would be used

  -------------------------------------------------------------
  **Units** **Legal** **Default**  **Required** **Variability**
            **Range**
  --------- --------- ------------ ------------ ---------------
  fraction  0 $\leq$  0.5 - 0.5    No           Monthly -
            *x*       \* cos(tilt)              Hourly
            $\leq$ 1  = .5 for
                      vertical
                      surface

  -------------------------------------------------------------

**wnVfGrndDf=*float***

View factor from this window to ground for diffuse radiation. For the shading effects of a fin(s), both wnVfSkyDf and wnVfGrndDf would be used.

  -------------------------------------------------------------
  **Units** **Legal** **Default**  **Required** **Variability**
            **Range**
  --------- --------- ------------ ------------ ---------------
  fraction  0 $\leq$  0.5 + 0.5 \* No           Monthly -
            *x*       cos(tilt) =               Hourly
            $\leq$ 1  .5 for
                      vertical
                      surface

  -------------------------------------------------------------

**endWindow**

Optionally indicates the end of the window definition. Alternatively, the end of the window definition can be indicated by END or the declaration of another object. END or endWindow, if used, should follow any subobjects of the window (SHADEs and/or SGDISTs).

  **Units**   **Legal Range**   **Default**   **Required**   **Variability**
  ----------- ----------------- ------------- -------------- -----------------
                                *N/A*         No             constant


