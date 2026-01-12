*&---------------------------------------------------------------------*
*& Report Z_S4_EXAMPLE_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_s4_example_01.

PARAMETERS: p_bukrs TYPE t001-bukrs OBLIGATORY.


START-OF-SELECTION.

  SELECT SINGLE bukrs, butxt, land1, waers

FROM t001

INTO @DATA(ls_company)

WHERE bukrs = @p_bukrs.


  IF sy-subrc = 0.

    WRITE: /                                                           |Company Code   : { ls_company-bukrs }|,

       / |Company Name   : { ls_company-butxt }|,

       / |Country        : { ls_company-land1 }|,

       / |Currency       : { ls_company-waers }|.

  ELSE.

    WRITE: 'Error: Company code not found'.

  ENDIF.
