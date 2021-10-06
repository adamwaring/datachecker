#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    argonDash::argonDashPage(

      body = argonDash::argonDashBody(


        selectInput("selected_dataset", "Dataset", c("datasets::airquality", "datasets::mtcars"), "datasets::airquality"),

        mod_eda_treatment_modal_ui("eda_treatment_modal_ui_1"),

        mod_eda_core_tabbox_ui("eda_core_tabbox_ui_1"),

        mod_eda_explore_tabbox_ui("eda_explore_tabbox_ui_1")

      )

    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'datachecker'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

