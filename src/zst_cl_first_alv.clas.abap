class ZST_CL_FIRST_ALV definition
  public
  final
  create public .

public section.

  interfaces IF_SERIALIZABLE_OBJECT .
  interfaces Z2UI5_IF_APP .

  data PRODUCT type STRING .
  data QUANTITY type STRING .
protected section.
private section.
ENDCLASS.



CLASS ZST_CL_FIRST_ALV IMPLEMENTATION.


  METHOD z2ui5_if_app~controller.

    CASE client->get( )-lifecycle_method.

      WHEN client->cs-lifecycle_method-on_init.
        product = 'tomato'.
        quantity = '500'.


      WHEN client->cs-lifecycle_method-on_event.

        CASE client->get( )-event.

          WHEN 'BUTTON_POST'.
            client->display_message_toast( |{ product } { quantity } ST - GR successful| ).

        ENDCASE.


      WHEN client->cs-lifecycle_method-on_rendering.

        DATA(view) = client->factory_view( ).

        DATA(page) = view->page( title = 'Page title' nav_button_tap = view->_event_display_id( client->get( )-id_prev_app ) ).
        page->simple_form('Form Title'
          )->content( 'f'
             )->title( 'Input'
             )->label( 'quantity'
             )->input( view->_bind( quantity )
             )->label( 'product'
             )->input( value = product editable = abap_false
             )->button( text = 'post' press = view->_event( 'BUTTON_POST' ) ).

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
