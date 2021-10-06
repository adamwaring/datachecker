#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import magrittr
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic

  mod_eda_explore_tabbox_server("eda_explore_tabbox_ui_1")

  mod_eda_core_tabbox_server("eda_core_tabbox_ui_1")

  mod_eda_treatment_modal_server("eda_treatment_modal_ui_1")
}
