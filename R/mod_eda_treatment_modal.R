#' eda_treatment_modal UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_eda_treatment_modal_ui <- function(id){
  ns <- NS(id)
  tagList(



  )
}

#' eda_treatment_modal Server Functions
#'
#' @noRd
mod_eda_treatment_modal_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_eda_treatment_modal_ui("eda_treatment_modal_ui_1")

## To be copied in the server
# mod_eda_treatment_modal_server("eda_treatment_modal_ui_1")
