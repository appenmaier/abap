CLASS zcx_no_customer_found DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg.
    INTERFACES if_t100_message.

    CONSTANTS:
      BEGIN OF zcx_no_customer_found,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '000',
        attr1 TYPE scx_attrname VALUE 'CUSTOMER_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_no_customer_found.

    METHODS constructor
      IMPORTING !previous   LIKE previous   OPTIONAL
                customer_id TYPE s_customer OPTIONAL.

    DATA customer_id TYPE s_customer.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcx_no_customer_found IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = zcx_no_customer_found.
    me->customer_id = customer_id.
  ENDMETHOD.
ENDCLASS.
