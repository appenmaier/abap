CLASS zcx_abap_initial_parameter DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg.
    INTERFACES if_t100_message.

    CONSTANTS:
      BEGIN OF zcx_abap_initial_parameter,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '003',
        attr1 TYPE scx_attrname VALUE 'PARAMETER',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_abap_initial_parameter.

    METHODS constructor
      IMPORTING !previous  LIKE previous OPTIONAL
                !parameter TYPE string   OPTIONAL.

    DATA parameter TYPE string.

ENDCLASS.


CLASS zcx_abap_initial_parameter IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = zcx_abap_initial_parameter.
    me->parameter = parameter.
  ENDMETHOD.
ENDCLASS.
